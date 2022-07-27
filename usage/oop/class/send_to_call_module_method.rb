module Shootable
  def self.included(base)
    base.class_eval do
      instance_variable_defined?("@t")
    end
  end
  def shoot_once
    if magazine.bullet_count > 0
      print "Bang!"
      magazine.eject_shell
      puts if magazine.bullet_count == 0
    end
  end

  def semi
    load_bullet
    shoot_once
  end

  def three_round_burst
    load_magazine
    3.times{ shoot_once }
  end

  def full_auto
    load_magazine
    magazine.times{ shoot_once }
  end
end