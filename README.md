Informacion general del proyecto 

Para esta entrega se creo un proyecto en Ruby on Rails lamado 'MisNotas'. 
Este consiste en una app donde un usuario puede crear, editar y eliminar notas, siendo estas organizadas en cuadernos con las mismas funcionalidades.

Un usuario posee cuadernos, los cuales organizan y contienen las notas.
Al crearse un usuario, se crea por defecto un cuaderno Global donde se guardan las notas que no estan categorizadas en ningun cuaderno. 
Para agregar una nota en el mismo simplemente se puede hacer a traves del boton de "agregar nota".
Este cuaderno global no puede ser eliminado ni modificado, por lo tanto, al querer eliminarlo o modificar su nombre, no se eliminara ni se guardara un nombre nuevo.
A traves del menu que aparece en la pagina principal, se puede acceder a "Mis cuadernos" donde se listan todos los cuadernos del usuario. 
Tambien se puede crear un cuaderno nuevo, el cual le pertenecera al usuario que esta logueado. 
En la visualizacion de los cuadernos del usuario, se pueden editar los nombres de los mismos, ver las notas que contiene, agregar una nota en ese cuaderno y eliminar el cuaderno junto a las notas que contiene.
Por lo tanto, para crear una nota nueva, primero se debe dirigir al cuaderno donde desea agregar la nota.
A su vez, al listar las notas de un cuaderno en particular, se puede editar o eliminar una determinada nota. 

Para ello cree los modelos y los controladores para las Notas, los Cuadernos y los Usuarios. 

Para el manejo de sesiones y validaciones de los usuarios utilice la gema Devise. 
Y para la exportacion en formato de texto rico de las notas utilice la gema ActionText.

Para ejecutar la aplicacion se debe tener instalado:
- Ruby
- SQLite3
- Node.js
- Yarn

Para crear la base de datos se debe ejecutar rails db:create
y luego rails db:migrate
Para levantar la aplicación rails server
