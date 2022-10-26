class Element

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def compare_to(element)
    fail "This method should be overridden"
  end
end



class Rock < Element

  def initialize(name)
    @name = name
  end

  def getName
    @name
  end 

  def compare_to(element)
    if element.getName == "Rock"
      return "Rock equals Rock", "Tie"
    elsif element.getName == "Paper"
      return "Paper covers Rock", "Lose"
    elsif element.getName == "Scissors"
      return "Rock crushes Scissors", "Win"
    elsif element.getName == "Lizard"
      return "Rock crushes Lizard", "Win"
    else
      return "Spock vaporizes Rock", "Lose"
    end
  end
end

class Scissors < Element

  def initialize(name)
    @name = name
  end
  
  def getName
    @name
  end 

  def compare_to(element)
    if element.getName == "Scissors"
      @description = "Scissors equals Scissors"
      @result = "Tie"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Paper"
      @description = "Scissors cut Paper"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Lizard"
      @description = "Scissors decapitate Lizard"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Spock"
      @description = "Spock smashes Scissors"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Rock"
      @description = "Rock crushes Scissors"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
  end
end

class Paper < Element

  def initialize(name)
    @name = name
  end

  def getName
    @name
  end 

  def compare_to(element)
    if element.getName == "Paper"
      @description = "Paper equals Paper"
      @result = "Tie"
      return "#{@description}", "#{@result}"
    end  
    if element.getName == "Scissors"
      @description = "Scissors cut Paper"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Lizard"
      @description = "Lizard eats Paper"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Spock"
      @description = "Paper disproves Spock"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Rock"
      @description = "Paper covers Rock"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
  end
end

class Lizard < Element

  def initialize(name)
    @name = name
  end

  def getName
    @name
  end 

  def compare_to(element)
    if element.getName == "Lizard"
      @description = "Lizard equals Lizard"
      @result = "Tie"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Paper"
      @description = "Lizard eats Paper"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Scissors"
      @description = "Scissors decapitate Lizard"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Spock"
      @description = "Lizard poisons Spock"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Rock"
      @description = "Rock crushes Lizard"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
  end
end

class Spock < Element

  def initialize(name)
    @name = name
  end

  def getName
    @name
  end 

  def compare_to(element)
    if element.getName == "Spock"
      @description = "Spock equals Spock"
      @result = "Tie"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Paper"
      @description = "Paper disproves Spock"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Lizard"
      @description = "Lizard poisons Spock"
      @result = "Lose"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Scissors"
      @description = "Spock smashes Scissors"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
    if element.getName == "Rock"
      @description = "Spock vaporizes Rock"
      @result = "Win"
      return "#{@description}", "#{@result}"
    end
  end
end

# rock = Rock.new('Rock')
# paper = Paper.new('Paper')
# scissors = Scissors.new('Scissors')
# lizard = Lizard.new('Lizard')
# spock = Spock.new('Spock')


# puts rock.compare_to(paper)
# puts paper.compare_to(rock)
# puts rock.compare_to(rock)
# puts lizard.compare_to(scissors)
# puts scissors.compare_to(rock)
# puts "#{rock.name}"

# $moves = [rock, paper, scissors, lizard, spock]
