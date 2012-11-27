module Output
  #module for user messages
  def shout(message)
    puts message
  end
  def warning(message)
    puts 'WARNING:' + message
  end
end

class Fighter
  attr_accessor :name
  attr_accessor :strength
  attr_accessor :defence
  attr_accessor :life
  
  def initialize(nm, str, df, lf= 100)
   @name = nm
   @strength = str
   @defence = df
   @life = lf
  end



  def loseLife(hp)
    #change life value, life can't be less then 0
    @life = @life - hp
    if @life < 0 then
      @life = 0
    end
  end

  def hit()
    #do actual damage
    return rand(@strength)+1
  end

end


class Fight
  include Output
  attr_accessor :status
  attr_accessor :winner

  def initialize(fighter1, fighter2)
    shout('Fight starts with ' + fighter1.name + ' and ' + fighter2.name)
    puts
    puts
    #fight status 'open'
    @status = true
  end

  def hit(attacker, defender)
    if defender.defence < rand(attacker.strength + defender.defence)+1 then
      #attacker missed
      shout(attacker.name + ' tried to be tricky and kick ' + defender.name + ' ass, but failed missereably')

     elsif attacker.life == 0
         break
     else
      #lets kick defenders ass
      defender.loseLife(hit = attacker.hit())
      shout(defender.name + ' got hit by ' + attacker.name + ' and lose ' + hit.to_s + ' life. Now ' + defender.name + ' has ' + defender.life.to_s + ' life')
      if defender.life == 0 then
        #promote winner, change fight status to 'finished'
        statusChange()
        setWinner(attacker)
      end
    end
  end

  def statusChange()
    @status = false
  end

  def setWinner(win)
    @winner = win.name
  end

end

if __FILE__ == $0
  include Output
  #make fighters
  shout('provide 1 fighters name:')
  first = Fighter.new(gets().chomp, 40, 40)
  shout('provide 2 fighters name:')
  second = Fighter.new(gets().chomp, 40, 40)

  #start fight
  round = Fight.new(first, second)
  
  #lets do actual fighting here
  while round.status
    round.hit(first, second)
    round.hit(second, first)
  end

  shout('Congrats to ' + round.winner)

end
