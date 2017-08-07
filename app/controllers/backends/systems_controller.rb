class Backends::SystemsController < BackendsController
  def edit
    render layout: false
  end

  def update
    @system.update(system_params_permit)

    redirect_to :back,flash: { success: '更新成功'}
  end

  def system_params_permit
    params.require(:system).permit(:name, :title, :description, :keyword, :phone,:fax, :address, :email,:facebook)
  end
end
