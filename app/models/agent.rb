class Agent < ActiveHash::Base
  include ActiveHash::Associations
  has_many :users, dependent: :destroy

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ジェット' },
    { id: 3, name: 'フェニックス' },
    { id: 4, name: 'ネオン' },
    { id: 5, name: 'ヨル' },
    { id: 6, name: 'レイズ' },
    { id: 7, name: 'レイナ' },
    { id: 8, name: 'セージ' },
    { id: 9, name: 'キルジョイ' },
    { id: 10, name: 'サイファー' },
    { id: 11, name: 'チェンバー' },
    { id: 12, name: 'ソーヴァ' },
    { id: 13, name: 'KAY/O' },
    { id: 14, name: 'スカイ' },
    { id: 15, name: 'フェイド' },
    { id: 16, name: 'ブリーチ' },
    { id: 17, name: 'ブリムストーン' },
    { id: 18, name: 'アストラ' },
    { id: 19, name: 'ヴァイパー' },
    { id: 20, name: 'オーメン' },
    { id: 21, name: 'ハーバー' },
  ]
end