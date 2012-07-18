module UpdateMultipleAction
  def create_or_update model
    @errors = {} 
    error_records = []
    model.transaction do
      params[model.to_s.underscore.pluralize.intern].each do |k,v|
        begin
          id = v[:id]
          v.delete :id
          unless id.empty?
            if v[:_destroy].to_i != 0 then
              model.find(id).destroy
            else
              v.delete :_destroy
              model.find(id).update_attributes!(v)
            end
          else
            if v[:_destroy].to_i == 0
              v.delete :_destroy 
              r = model.create!(v)
            end
          end
        rescue ActiveRecord::RecordInvalid => e
          @errors[e.record] = e.record.errors
          error_records << e.record
        end
      end
    end
    (model.find(:all).to_a.concat(error_records))
  end
end 

