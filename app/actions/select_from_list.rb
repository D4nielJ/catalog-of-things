require_relative '../modules/input_module'
require_relative '../modules/display_module'

class SelectFromList
  include InputModule
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'Select Menu'
  end

  def do_helper_action(state, collection, action, title)
    p collection.instance_variables
    temp = [*collection, action]
    List_Collection.call(temp, title, %i[name], Display_Table)
    temp = Show_Prompt_With_Callback.call(%i[index], 'Select from the list', temp, callback: Get_By_Index)
    temp.respond_to?(:do_action) ? temp.send(:do_action, state) : temp
  end
end
