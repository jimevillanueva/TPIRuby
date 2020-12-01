module RN
        class Books
            def self.name?(title)
                if title.match?(/^[^\s][A-Za-z0-9\s]+[^\s]$/)
                  return true
                else
                    return false
                end
              end

            def self.create(name)
                n = self.name?(name)
                if(n == false)
                    puts "UPS! ----------------- \n - El nombre del cuaderno no cumple con el formato.\n - No puede comenzar ni finalizar con espacios, ni contener caracteres especiales \n - Intente ingresando uno que contenga letras minusculas, mayusculas, numeros y/o espacios."
                else
                    nam = "#{Dir.home}/.my_rns/#{name}"
                    if (!Dir.exist?(nam))
                        Dir.mkdir(nam)
                    else
                        puts "UPS! ----------------- \n Ya existe un cuaderno con ese nombre, intente ingresando otro"
                    end
                end
            end

            def self.delete(name)
                if (Dir.exist?(name))
                    Dir.glob("#{name}/*.rn").each {|filename| File.delete(filename)== '.rn'}
                    Dir.delete(name)
                else
                    puts "UPS! ----------------- \n No existe un cuaderno con ese nombre, intente ingresando otro"
               end
            end

            def self.list
                puts Dir.each_child("#{Dir.home}/.my_rns") {|filename| puts filename}
            end

            def self.rename(old,new)
                if (Dir.exist?(old))
                    File.rename(old, new)
                else
                    puts "UPS! ----------------- \n No existe un cuaderno con ese nombre, intente ingresando otro"
               end
            end

            def self.export(book)
                if (Dir.exist?("#{Dir.home}/.my_rns/#{book}"))
                    if (book.nil?)
                        Dir.each_child("#{Dir.home}/.my_rns") {|dir| Dir.each_child("#{Dir.home}/.my_rns/#{dir}") { |note| RN::Notes.exportar("#{Dir.home}/.my_rns/#{dir}/#{note}") }}
                    else
                        Dir.each_child("#{Dir.home}/.my_rns/#{book}") {|filename| RN::Notes.exportar("#{Dir.home}/.my_rns/#{book}/#{filename}") }
                    end
                else
                    warn "UPS! ---------------- \n No existe un cuaderno con ese nombre, intente ingresando otro"
                end
            end
        end
end