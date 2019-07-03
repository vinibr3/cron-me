class ActiveStorageAttachmentsController < ApplicationController
  def destroy
    @active_storage_attachment =
      ActiveStorageAttachment.where(record_id: params[:record_id],
                                    id: params[:id]).first
    respond_to do |format|
      format.js { @active_storage_attachment.destroy }
    end
  end
end
