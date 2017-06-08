module ApplicationHelper
  def missing_role(roles)
    conn = " #{I18n.t('or')} "
    I18n.t("missing_role",roles: roles.to_sentence(last_word_connector: conn, two_words_connector: conn))
  end
end
