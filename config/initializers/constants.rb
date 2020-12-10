module Constants
  USER_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PROJECT_TITLE_RANGE_LENGTH = (3..64).freeze
  TASK_NAME_RANGE_LENGTH = (3..64).freeze
  COMMENT_BODY_RANGE_LENGTH = (3..256).freeze
end
