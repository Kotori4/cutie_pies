class HavePet < ActiveHash::Base
  self.data = [
    { id: 1, name: '猫がいる！' },
    { id: 2, name: '犬がいる！' },
    { id: 3, name: '両方いる！' },
    { id: 4, name: '別の動物がいる！' },
    { id: 5, name: 'いない！悲しい！' }
  ]
end
