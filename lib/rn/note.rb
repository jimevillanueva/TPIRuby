require 'tty-editor'
require 'colorputs'
module RN
        class Notes
            def self.name?(title)
                if title.match?(/^[^\s][A-Za-z0-9\s]+[^\s]$/)
                  return true
                else
                    return false
                end
            end

            def self.create(title, book)
                m = name?(title)
                if(m == false) # => formato incorrecto
                    return warn "UPS! ----------------- \n - El nombre de la nota no cumple con el formato.\n - No puede comenzar ni finalizar con espacios ni contener caracteres especiales. No agregue la extension del archivo\n - Intente ingresando uno que contenga letras minusculas, mayusculas, numeros y/o espacios."
                else # => formato correcto
                    if (!Dir.exist?("#{Dir.home}/.my_rns")) # => si es la primer nota
                        Dir.mkdir("#{Dir.home}/.my_rns")
                    end
                    if (book.nil?) # => si no envio un cuaderno
                        if (!Dir.exist?("#{Dir.home}/.my_rns/global")) # => si no existe global (porque es la primer nota de global)
                            Dir.mkdir("#{Dir.home}/.my_rns/global")
                        end
                        t = "#{Dir.home}/.my_rns/global/#{title}.rn"  # => agrega nota en global
                        book = "global"
                    else # => si se envio un cuaderno
                        if (!Dir.exist?("#{Dir.home}/.my_rns/#{book}")) # => si no existe el cuaderno
                        return warn "UPS! ----------------- \n No existe un cuaderno con ese nombre. \n Intente ingresando otro nombre o cree el cuaderno que desea"
                        else
                             t = "#{Dir.home}/.my_rns/#{book}/#{title}"
                        end
                    end
                    if (File.exist?(t)) # => si ya existe una nota con ese nombre
                    return warn "UPS! ----------------- \n No se pudo crear la nota. Ya existe una nota con ese titulo. Intente con otro"
                    end
                        File.new(t, "w+")
                        TTY::Editor.open(t)
                        puts File.read(t), :yellow  
                        return warn "Se creo la nota con título '#{title}' (en el libro '#{book}') en el cajon de notas ubicado en #{Dir.home}/.my_rns"
                end       
            end

            def self.edit(title)
                if (File.exist?(title))
                    TTY::Editor.open(title)
                    puts File.read(title), :yellow  
                else
                    return warn "UPS! ----------------- \n No existe una nota con ese nombre. Intente ingresando otro"
               end
            end

            def self.rename(old, new)
                if (File.exist?(old))
                    File.rename(old, new)
                else
                    puts "UPS! ----------------- \n No existe una nota con ese nombre, intente ingresando otro"
               end
            end

            def self.show(title)
                if (File.exist?(title))
                     puts File.read(title), :yellow
                else
                     puts "UPS! ----------------- \n No existe una nota con ese nombre, intente ingresando otro"
                end
            end

            def self.list(book, global)
                if (book.nil?)
                    puts Dir.each_child("#{Dir.home}/.my_rns/global") {|filename| puts filename}
                else 
                    puts Dir.each_child("#{Dir.home}/.my_rns/#{book}") {|filename| puts filename}
                end
            end

            def self.delete(title)
                if (File.exist?(title))
                     File.delete(title)
                else
                    puts "UPS! ----------------- \n No existe una nota con ese nombre, intente ingresando otro"
                end
            end
        end
end