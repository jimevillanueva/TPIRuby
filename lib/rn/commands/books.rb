module RN
  module Commands
    module Books
      class Create < Dry::CLI::Command
        desc 'Create a book' #descripcion que aparece en consolo cuando se listan los comandos

        argument :name, required: true, desc: 'Name of the book'

        example [
          '"My book" # Creates a new book named "My book"',
          'Memoires  # Creates a new book named "Memoires"'
        ]

        def call(name:, **)
          RN::Books.create(name)
          warn "se creo el cuaderno llamado '#{name}'.\n en el cajon de notas ubicado en #{Dir.home}/.my_rns/#{name}."
        end
      end

      class Delete < Dry::CLI::Command
        desc 'Delete a book'

        argument :name, required: false, desc: 'Name of the book'
        option :global, type: :boolean, default: false, desc: 'Operate on the global book'

        example [
          '--global  # Deletes all notes from the global book',
          '"My book" # Deletes a book named "My book" and all of its notes',
          'Memoires  # Deletes a book named "Memoires" and all of its notes'
        ]

        def call(name: nil, **options)
          global = options[:global]
          if(global)
            RN::Books.delete("#{Dir.home}/.my_rns/global")
            warn "Se elimino el cuaderno de notas con nombre 'global'."
          else
            RN::Books.delete("#{Dir.home}/.my_rns/#{name}")
            warn "Se elimino el cuaderno de notas con nombre '#{name}'."
          end
        end
      end

      class List < Dry::CLI::Command
        desc 'List books'

        example [
          '          # Lists every available book'
        ]

        def call(*)
          RN::Books.list
          warn "listado de los cuadernos de notas.\n"
        end
      end

      class Rename < Dry::CLI::Command
        desc 'Rename a book' 

        argument :old_name, required: true, desc: 'Current name of the book'
        argument :new_name, required: true, desc: 'New name of the book'

        example [
          '"My book" "Our book"         # Renames the book "My book" to "Our book"',
          'Memoires Memories            # Renames the book "Memoires" to "Memories"',
          '"TODO - Name this book" Wiki # Renames the book "TODO - Name this book" to "Wiki"'
        ]

        def call(old_name:, new_name:, **)
          RN::Books.rename("#{Dir.home}/.my_rns/#{old_name}", "#{Dir.home}/.my_rns/#{new_name}")
          warn "Se renombro el cuaderno de notas con nombre '#{old_name}' para que pase a llamarse '#{new_name}'.\n."
        end
      end
      
      class Export < Dry::CLI::Command
        desc 'Export all notes of a book'

        option :book, type: :string, desc: 'Book'

        example [
          '--book "My book"     # Export all notes in the book "My book"',
          '--book global        # Export all notes in the global book'
        ]

        def call(**options)
          book = options[:book]
          RN::Books.export(book)
          if (book.nil?)
            warn "Se exportaron a formato HTML todas las notas de todos los cuadernos del cajon de notas"
          else
            warn "Se exportaron a formato HTML todas las notas del cuaderno '#{book}' del cajon de notas"
          end
        end
      end

    end
  end
end
