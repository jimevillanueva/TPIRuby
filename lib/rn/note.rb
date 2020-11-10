module RN
        class Notes

            def self.create(title, book)
                require 'tty-editor'
                require 'colorputs'
                t = "#{Dir.home}/.my_rns/#{book}/#{title}"
                puts book
                if (!Dir.exist?("#{Dir.home}/.my_rns"))
                    Dir.mkdir("#{Dir.home}/.my_rns")
                end
                    if (book.nil?) 
                       if (!Dir.exist?("#{Dir.home}/.my_rns/global"))
                           Dir.mkdir("#{Dir.home}/.my_rns/global")
                        end
                     t = "#{Dir.home}/.my_rns/global/#{title}"
                    end
                if (File.exist?(t))
                        puts 'No se pudo crear la nota. Ya existe una nota con ese titulo. Intente con otro'
                else
                     File.new(t, "w+")
                     TTY::Editor.open(t)
                     puts File.read(t), :yellow  
                end          
            end

            def self.edit(title)
                if (File.exist?(title))
                    TTY::Editor.open(title)
                    puts File.read(title), :yellow  
                else
                    puts "no existe una nota con ese nombre, intente ingresando otro"
               end
            end

            def self.rename(old, new)
                if (File.exist?(old))
                    File.rename(old, new)
                else
                    puts "no existe una nota con ese nombre, intente ingresando otro"
               end
            end

            def self.show(title)
                if (File.exist?(title))
                     puts File.read(title), :yellow
                else
                     puts "no existe una nota con ese nombre, intente ingresando otro"
                end
            end

            def self.list(book, global)
                if (book.nil?)
                    puts Dir.glob("#{Dir.home}/.my_rns/global/*.rn")
                else 
                    puts Dir.glob("#{Dir.home}/.my_rns/#{book}/*.rn")
                end
            end

            def self.delete(title)
                puts File.exist?(title)
                if (File.exist?(title))
                     File.delete(title)
                else
                    puts "no existe una nota con ese nombre, intente ingresando otro"
                end
            end
        end
end