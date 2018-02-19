class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss, employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    # return self.salary * multiplier unless self.employees
    self.subordinate_salaries * multiplier
  end

  def subordinate_salaries
    total = 0
    if self.employees.none? { |emp| emp.is_a?(Manager) }
      self.employees.each do |emp|
        total += emp.salary
      end
    else
      self.employees.each do |emp|
        if emp.is_a?(Manager)
          total += emp.subordinate_salaries + emp.salary
        else
          total += emp.salary
        end
      end
    end
    return total
  end
end




# manager_bonus >>> iterates and adds
#
# employee_bonus >>> salary * multiplier
#
# check if its a manager >> do something different
#
# [manager, employee, employee, manager]
#
# emp.bonus(multipler)
