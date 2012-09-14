class SilentSanitizer < ActiveModel::MassAssignmentSecurity::LoggerSanitizer
  # i'm on 3.2.6 so this method only takes attrs argument
  def process_removed_attributes attrs
    if logger?
      logger.debug { "DEBUG: Silently sanitized the following attributes #{attrs.to_s}" }
    end
  end
end
