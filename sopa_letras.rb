class Board
  @@boards_templates = #[["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"]
   [["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"]
   #[["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"] 
  @@aux = []
  @@sopa_arreglo = Array.new(8) { Array.new(5) }
  @@alfabeto = ("A".."Z").to_a
  @@palabra = []
  @@w = ""
  def initialize
     complete_board!
  end
#http://www.genbetadev.com/paradigmas-de-programacion/solid-cinco-principios-basicos-de-diseno-de-clases
  def imprime_tablero(aux)
    @@aux.each_with_index do |valor, indice|
      indice += 1  
      if indice % 5 != 0  
        print "#{valor} "
      else
        puts valor
      end
    end
  end

  def include?(word)
    busca_der_izq(word)
    busca_izq_der(word)
    busca_arr_aba(word)
    busca_aba_arr(word)
    busca_diagonal_aba_der(word)
    busca_diagonal_aba_izq(word)
    busca_diagonal_inv_izq(word)
    busca_diagonal_inv_der(word)
  end

  def busca_der_izq(word)
    word = word.split(//)
    tam = (word.size) -1
    @@sopa_arreglo.each_with_index do |var,ind|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= ind
          indice2 = index
          for i in 0..tam
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice2 -= 1
          end
          if word == @@palabra
            p "Encontrado de derecha a izquierda #{word.join}"
          else
            @@palabra = []
          end
        end
      end
    end
  end

  def busca_izq_der(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,ind|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= ind
          indice2 = index
          for i in 0..tam
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice2 += 1
          end
          if word == @@palabra 
            p "Encontrado de izquierda a derecha #{word.join}"
          else
            @@palabra = []
          end
        end
      end
    end
  end
  
  def busca_arr_aba(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,primer|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= primer
          indice2 = index
          for i in 0..tam
            break if indice1 ==8
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice1 += 1
          end
          if word == @@palabra 
            p "Encontrado de arriba a abajo #{word.join}"
            @@palabra = []
          else
            @@palabra = []
          end
        end
      end
    end
  end

  def busca_aba_arr(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,primer|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= primer
          indice2 = index
          for i in 0..tam
            break if indice1 == -1
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice1 -= 1
          end
          if word == @@palabra 
            p "Encontrado de abajo a arriba #{word.join}"
            @@palabra = []
          else
            @@palabra = []
          end
        end
      end
    end
  end

  def busca_diagonal_aba_der(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,primer|
      var.each_with_index do |letra, index|
        if letra == word[0]
          @@palabra = []
          indice1= primer
          indice2 = index
          for i in 0..tam
            break if indice1 == 8
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice1 += 1
            indice2 +=1
          end
          if word == @@palabra 
            p "Encontrado de forma diagonal hacia abajo a derecha #{word.join}"
            @@palabra = []
          else
            @@palabra = []
          end
        end
      end
    end
  end

  def busca_diagonal_aba_izq(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,primer|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= primer
          indice2 = index
          for i in 0..tam
            break if indice1 == 8
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice1 += 1
            indice2 -=1
          end
          if word == @@palabra 
            p "Encontrado de forma diagonal hacia abajo a izquierda #{word.join}"
            @@palabra = []
          else
            @@palabra = []
          end
        end
      end
    end
  end

  def busca_diagonal_inv_der(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,primer|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= primer
          indice2 = index
          for i in 0..tam
            break if indice1 == -1
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice1 -= 1
            indice2 +=1
          end
          if word == @@palabra 
            p "Encontrado de forma diagonal inversa a derecha #{word.join}"
            @@palabra = []
          else
            @@palabra = []
          end
        end
      end
    end
  end

  def busca_diagonal_inv_izq(word)
    word = word.split(//)
    tam = (word.size) -1
    @@palabra = []
    @@sopa_arreglo.each_with_index do |var,primer|
      var.each_with_index do |letra, index|
        if letra == word[0]
          indice1= primer
          indice2 = index
          for i in 0..tam
            break if indice1 == -1
            @@palabra << @@sopa_arreglo[indice1][indice2]
            indice1 -= 1
            indice2 -=1
          end
          if word == @@palabra 
            p "Encontrado de forma diagonal inversa a izquierda #{word.join}"
          else
            @@palabra = []
          end
        end
      end
    end
  end

  private

  def complete_board!
    #cambia las X por una letra
    @@aux = @@boards_templates[1].split(//)
    @@aux.map! do |letra|
      @@alfabeto.shuffle!
      if letra == "X"
        letra = @@alfabeto[0]
      else
        letra = letra
      end
    end
    imprime_tablero(@@aux)
    #hace el arreglo en posicion de 8x5 para buscar palabras
    var = 0
    for i in 0..7
      for j in 0..4
        @@sopa_arreglo[i][j]= @@aux[var]
        var += 1
      end
    end
    @@w = @@boards_templates[0][0]
    include?(@@w)
    @@w = @@boards_templates[0][1]
    include?(@@w)
    @@w = @@boards_templates[0][2]
    include?(@@w)
    @@w = @@boards_templates[0][3]
    include?(@@w)
  end
end

board = Board.new
