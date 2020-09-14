class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    CLICKBAIT_KEYWORDS = [/won't believe/i, /secret/i, /top[0-9]*/i, /guess/i]

    def clickbait?
        if CLICKBAIT_KEYWORDS.none? { |x| x.match title }
            errors.add(:title, "clickbait")
        end
    end

end
