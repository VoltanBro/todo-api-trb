module Constants
  PROJECT_TITLE_RANGE_LENGTH = (3..64).freeze
  TASK_NAME_RANGE_LENGTH = (3..64).freeze
  USER_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
end
