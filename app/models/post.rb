class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_click_bait


  def is_click_bait

    !self.title && return

    click_array = ["Won't Believe", "Secret", "Top[number]", "Guess"]
    click_array.each do |phrase|
      self.title.include?(phrase) && return

    end
    self.errors[:title] << "Title is not clicbaitey enough you noob"

  end



end

# self.errors[:title] << "Title is not clicbaitey enough you noob"
