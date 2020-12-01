INFORMACION ACERCA DE ESTRUCTURAS Y FORMATOS

Clase NOTES:
cree una clase Note.rb la cual contiene la logica que resuelve las distintas operaciones que se desean realizar sobre las notas.
Estas son:
    – Creación de una nota.                                   => se debe indicar el titulo de la nota
    – Listado de notas, que puede o no filtrarse por cuaderno. 
    – Vista de una nota.                                      => se debe indicar el titulo de la nota
    – Modificación del título una nota.                       => se debe indicar el titulo original y el nuevo
    – Modificación del contenido una nota.                    => se debe indicar el titulo de la nota
    – Borrado de una nota.                                    => se debe indicar el titulo de la nota
    
Para ello, realice distintos metodos de la clase los cuales reciben como argumento el nombre de la nota, y opcionalmente, un cuaderno. En el ultimo caso, esto 
debe hacerce a traves de --book cuaderno. 
Todas las operaciones anteriores, excepto listar, reciben obligatoriamente el titulo de la nota, y opcional el cuaderno por el que se organiza.
Al momento de crear una nota, en el caso de que no exista el cajon de notas donde se guardaran las mismas (llamado .my_rns), se creara automaticamente en el mo-
mento que se cree la primer nota en el home del usuario (/home/user/.my_rns). A la vez, si no se le indica un cuaderno donde ubicar la nota (o se ingresa la 
opcion --global), creara un cuaderno global para almacenar la misma (y futuras notas que no tengan cuaderno). Por lo contrario, si se le indica un cuaderno, 
validara que exista, y en el caso fallido, se mostrara un mensaje de error al usuario para que cree uno o elija otro cuaderno.
Para validar el formato del nombre, realice un metodo aparte el cual es llamado al momento de crear una nota. Este devuelve si coincide con el formato esperado o no.
Este formato sera valido cuando el nombre de la nota contenga letras minusculas, letras mayusculas, numeros y/o espacios. Por lo tanto, sera invalido cuando contenga
caracteres especiales (!/@#(&^%.,...) o contenga espacios al comienzo o al final del nombre especificado. 
En el caso de querer nombrar una nota con espacios, es decir por ejemplo, "receta de cocina", lo podra hacer siempre y cuando utilice comillas, simples o dobles, en-
cerrando dicho nombre. Asimismo, no debe incluirse la extension del archivo, ya que, es incluido al crear una nota (el mismo sera .rn). No se admitiran otras exten-
siones, lo cual esta contemplado en la validacion del formato del nombre.
Al crear o modificar una nota, se mostrara opciones para elegir un editor de texto para mejor facilidad al usuario.

    Para realizar dichas operaciones sobre las notas, se dispone de una lista de comandos especiales con una breve descripcion :
    (se pueden observar con ruby bin/rn notes --h): 
    * rn notes create TITLE                                   # Create a note
    * rn notes delete TITLE                                   # Delete a note
    * rn notes edit TITLE                                     # Edit the content a note
    * rn notes list                                           # List notes
    * rn notes retitle OLD_TITLE NEW_TITLE                    # Retitle a note
    * rn notes show TITLE                                     # Show a note

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

Clase BOOKS:
    
cree una clase Book.rb la cual contiene la logica que resuelve las distintas operaciones que se desean realizar sobre los cuadernos.Estas son:
– Creacion de un cuadernos de notas.        => se indica el nombre del cuaderno
– Listado de los cuadernos de notas.  
– Renombrado de un cuaderno.                => se indica el nombre original del cuaderno y el nuevo
– Borrado de un cuaderno.                   => se indica el nombre del cuaderno

Para realizar dichas operaciones sobre los cuadernos, se dispone de una lista de comandos especiales con una breve descripcion :
(se pueden observar con ruby bin/rn books --h)
Todas las operaciones anteriores, excepto listar, reciben obligatoriamente el titulo del cuaderno.
Al momento de crear un cuaderno se validara que este cumpla con el formato de nombre indicado anteriormente, y no contendra extension. 
En los mismos se podran organizar notas pero no cuadernos.
En el caso de eliminar un cuaderno, este se eliminara junto todas las notas que contenga.
    
      * rn books create NAME                               # Create a book
      * rn books delete [NAME]                             # Delete a book
      * rn books list                                      # List books
      * rn books rename OLD_NAME NEW_NAME                  # Rename a book
