class TitleValidator < ActiveModel::Validator

    def validate(record)
    
        unless record.title.match("Won't Believe" || "Secret" || "Top 10" || "Guess")
            record.errors.email << "Title is not click-baity enough!"

        end
    end
end