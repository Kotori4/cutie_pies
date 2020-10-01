class HavePet < ActiveHash::Base
  self.data = [
    { id: 1, name: '猫がいる！' },
    { id: 2, name: '猫がいた！' },
    { id: 3, name: '犬がいる！' },
    { id: 4, name: '犬がいた！' },
    { id: 5, name: '両方いる！' },
    { id: 6, name: '両方いた！' },
    { id: 7, name: '別の動物がいる！' },
    { id: 8, name: '別の動物がいた！' },
    { id: 9, name: 'いない！悲しい！' }
  ]
end
