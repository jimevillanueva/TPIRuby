module RN
  module Commands
    module Notes
      class Create < Dry::CLI::Command
        desc 'Create a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Creates a note titled "todo" in the global book',
          '"New note" --book "My book" # Creates a note titled "New note" in the book "My book"',
          'thoughts --book Memoires    # Creates a note titled "thoughts" in the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          RN::Notes.create(title,book)
          end
      end

      class Delete < Dry::CLI::Command
        desc 'Delete a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Deletes a note titled "todo" from the global book',
          '"New note" --book "My book" # Deletes a note titled "New note" from the book "My book"',
          'thoughts --book Memoires    # Deletes a note titled "thoughts" from the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if(book.nil?)
            RN::Notes.delete("#{Dir.home}/.my_rns/global/#{title}")
            warn "Se elimino la nota con título '#{title}' (del libro 'global').\n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          else
          RN::Notes.delete("#{Dir.home}/.my_rns/#{book}/#{title}")
          warn "Se elimino la nota con título '#{title}' (del libro '#{book}').\n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          end
        end
      end

      class Edit < Dry::CLI::Command
        desc 'Edit the content a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Edits a note titled "todo" from the global book',
          '"New note" --book "My book" # Edits a note titled "New note" from the book "My book"',
          'thoughts --book Memoires    # Edits a note titled "thoughts" from the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if (book.nil?)
            RN::Notes.edit("#{Dir.home}/.my_rns/global/#{title}")
            warn "Se momdifico la nota con título '#{title}' (en el libro 'global') \n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          else
            RN::Notes.edit("#{Dir.home}/.my_rns/#{book}/#{title}")
            warn "Se momdifico la nota con título '#{title}' (en el libro '#{book}') \n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          end
        end
      end

      class Retitle < Dry::CLI::Command
        desc 'Retitle a note'

        argument :old_title, required: true, desc: 'Current title of the note'
        argument :new_title, required: true, desc: 'New title for the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo TODO                                 # Changes the title of the note titled "todo" from the global book to "TODO"',
          '"New note" "Just a note" --book "My book" # Changes the title of the note titled "New note" from the book "My book" to "Just a note"',
          'thoughts thinking --book Memoires         # Changes the title of the note titled "thoughts" from the book "Memoires" to "thinking"'
        ]

        def call(old_title:, new_title:, **options)
          book = options[:book]
          if (book.nil?)
            RN::Notes.rename("#{Dir.home}/.my_rns/global/#{old_title}", "#{Dir.home}/.my_rns/global/#{new_title}")
            warn "Se cambio del título de la nota con título '#{old_title}' hacia '#{new_title}' (del libro 'global'). \n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          else
            RN::Notes.rename("#{Dir.home}/.my_rns/#{book}/#{old_title}", "#{Dir.home}/.my_rns/#{book}/#{new_title}")
            warn "Se cambio del título de la nota con título '#{old_title}' hacia '#{new_title}' (del libro '#{book}'). \n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          end
        end
      end

      class List < Dry::CLI::Command
        desc 'List notes'

        option :book, type: :string, desc: 'Book'
        option :global, type: :boolean, default: false, desc: 'List only notes from the global book'

        example [
          '                 # Lists notes from all books (including the global book)',
          '--global         # Lists notes from the global book',
          '--book "My book" # Lists notes from the book named "My book"',
          '--book Memoires  # Lists notes from the book named "Memoires"'
        ]

        def call(**options)
          book = options[:book]
          global = options[:global]
          RN::Notes.list(book,global)
          if(book)
            warn "Listado de las notas del libro '#{book}'.\n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          else
            warn "Listado de las notas del libro 'global'.\n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          end
        end
      end

      class Show < Dry::CLI::Command
        desc 'Show a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Shows a note titled "todo" from the global book',
          '"New note" --book "My book" # Shows a note titled "New note" from the book "My book"',
          'thoughts --book Memoires    # Shows a note titled "thoughts" from the book "Memoires"'
        ]

        def call(title:, **options)
          book = options[:book]
          if (book.nil?)
            RN::Notes.show("#{Dir.home}/.my_rns/global/#{title}")
            warn "Esta es la vista de la nota con título '#{title}' (del libro 'global').\n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          else
            RN::Notes.show("#{Dir.home}/.my_rns/#{book}/#{title}")
            warn "Esta es la vista de la nota con título '#{title}' (del libro '#{book}').\n del cajon de notas ubicado en #{Dir.home}/.my_rns"
          end
       end
      end

       class Export < Dry::CLI::Command
        desc 'Export a note'

        argument :title, required: true, desc: 'Title of the note'
        option :book, type: :string, desc: 'Book'

        example [
          'todo                        # Export a note titled "todo" in the global book',
          '"New note" --book "My book" # Export a note titled "New note" in the book "My book"',
          'thoughts --book Memoires    # Export a note titled "thoughts" in the book "Memoires"',
        ]

        def call(title:, **options)
          book = options[:book]
          RN::Notes.export(title,book)
        end
      end
    end
  end
end
