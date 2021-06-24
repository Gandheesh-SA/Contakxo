import 'package:contakxo/models/contacts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactsDatabase {
  // A global field instance which calls the constructor.
  static final ContactsDatabase instance = ContactsDatabase._init();

  // A Database field that comes from SQFLITE PACKAGE.
  static Database? _database;

  // Private Constructor.
  ContactsDatabase._init();

  // This method opens our database.
  Future<Database> get database async {

    // If database exist it'll will return our database.
    if (_database != null) return _database!;

    // Else it will initialize a new database
    _database = await _initDB('contacts.db');
    return _database!;
  }

  // This Future method will initialize our database.
  // Initialise meaning it will create a new database with a schema.
  Future<Database> _initDB(String filePath) async {

    // Stores database in file storage system.
    final dbPath = await getDatabasesPath();

    // Complete path where the database is stored.
    final path = join(dbPath, filePath);

    /*
    We will open the database by passing the complete file path
    where the database is located,
    a initial version of the database and schema of the database.
    */
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

   // Here we define the schema of the database.
  Future _createDB(Database db, int version) async {

    // What data-types each column will store
    final idType ='INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType= 'TEXT NOT NULL';
    final integerType ='INTEGER NOT NULL';

    // This will help us to create our table in the database
    await db.execute('''    
    CREATE TABLE $tableContacts(
      ${ContactFields.id} $idType,
      ${ContactFields.name} $textType,
      ${ContactFields.email} $textType,
      ${ContactFields.contactnumber} $integerType      
    )
    ''');

  }

  // To create new contacts
  Future<Contacts> create (Contacts contact) async{
    // Reference to our database
    final db = await instance.database;

    // Alternate query method

    // A unique id is generated
                            // Name of the Table.
    final id = await db.insert(tableContacts, contact.toJson());
                                            // Data that has to entered in the table.
    return contact.copy(id:id);
  }

  // To read a contact

  Future<Contacts?> readContact(int id) async {
    // Reference to our database
    final db = await instance.database;
    final maps = await db.query(
        tableContacts, // The table we want to query.
        columns: ContactFields.values, // The columns we want to retrieve from the table.
        where: '${ContactFields.id} =?',
        whereArgs: [id],
    );
    if(maps.isNotEmpty){
      return Contacts.fromJson(maps.first);
    } else{
      return null;
    }
  }

  Future<List<Contacts>> readAllContacts() async {
    // Reference to our database
    final db = await instance.database;
    final orderBy = '${ContactFields.name} ASC';
    final result = await db.query(tableContacts, orderBy: orderBy);
    return result.map((json) => Contacts.fromJson(json)).toList();
  }

  Future<int> update(Contacts contacts) async {
    final db = await instance.database;

    return db.update(
      tableContacts,
      contacts.toJson(),
      where: '${ContactFields.id} = ?',
      whereArgs: [contacts.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableContacts,
      where: '${ContactFields.id} = ?',
      whereArgs: [id],
    );
  }

  // A method to close the database.
  Future close() async {

    // This will have the database that we created.
    final db = await instance.database;

    // This built in function will close the database.
    db.close();
  }
}