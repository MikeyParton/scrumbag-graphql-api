class Reorder
  def initialize(item:, position:, parent_key:, parent_id:)
    @item  = item
    @parent_key = parent_key
    @parent_id  = parent_id
    @position   = position
  end

  def call
    maybe_change_parent
    @item.insert_at(@position)
  end

  def maybe_change_parent
    return if @item.send(@parent_key) == @parent_id
    @item.remove_from_list
    @item.send("#{@parent_key}=", @parent_id)
    @item.save
  end

  def self.reset
    List.all.order(:created_at).each_with_index do |list, index_1|
      list.update_column(:position, index_1)
      list.cards.order(:created_at).each.with_index do |card, index_2|
        card.update_column(:position, index_2)
      end
    end
  end
end
