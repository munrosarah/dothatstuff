json.list do
  json.extract!(@list, :id, :title)
end

json.list_items @list_items do |list_item|
  json.partial! 'list_items/list_item', list_item: list_item
end

