class ContactMailer < ActionMailer::Base
  default :from => "flordeajedrez@gmail.com",
          :to => RECIPIENTS,
          :bcc => BCC_RECIPIENTS

  def subscription email
    @email = email
    mail(:subject => "Nuevo subscriptor: #{email}")
  end

  def contact nombre,email,asunto,descripcion
    @nombre = nombre
    @descripcion = descripcion
    @email = email
    mail(:subject => "Consulta: #{asunto}")
  end
end
