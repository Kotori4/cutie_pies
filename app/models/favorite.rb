class Favorite < ActiveHash::Base
  self.data = [
    { id: 1, name: '猫派' },
    { id: 2, name: '犬派' },
    { id: 3, name: '両方' }
  ]
end