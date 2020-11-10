module RN
        class Books

            def self.create(name)
                if (!Dir.exist?(name))
                    Dir.mkdir(name)
                else
                    puts "ya existe un cuaderno con ese nombre, intente ingresando otro"
               end
            end

            def self.delete(name)
                if (Dir.exist?(name))
                    Dir.glob("#{name}/*.rn").each {|filename| File.delete(filename)== '.rn'}
                    Dir.delete(name)
                else
                    puts "no existe un cuaderno con ese nombre, intente ingresando otro"
               end
            end

            def self.list
                puts Dir.glob("#{Dir.home}/.my_rns/*").reject {|filename| File.extname(filename)== '.rn' }
            end

            def self.rename(old,new)
                if (Dir.exist?(old))
                    File.rename(old, new)
                else
                    puts "no existe un cuaderno con ese nombre, intente ingresando otro"
               end
            end

        end
end