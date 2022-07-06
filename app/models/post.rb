class Post < ActiveRecord::Base
# include ActiveModel::Validations
# validates_with TitleValidator

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction )}
    
    validate :is_clickbait?
    @@clickbait = ["Won't Believe", "Secret", "Top 10", "Guess" ]
    def clickbait_vldtr
        # unless :title.match("Won't Believe" || "Secret" || "Top 10" || "Guess")
        #      errors.add(:title, "Need a clickbaity title!")
        #  end

         unless @@clickbait.each {|bait| bait.match(:title)}
       errors.add(:title, "Need a clickbaity title!")
        end 
    end
    

    def clicker?
        if @@clickbait.none? { |cb_title| cb_title.match title}
        errors.add(:title, "Need a clickbaity title!")
        end 

       
    end

    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end




end
