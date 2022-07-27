require 'json'
# :reek:InstanceVariableAssumption
# :reek:IrresponsibleModule
class MyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    @type = env['Content-Type']
    status, headers, body = @app.call(@env)
    body << "<br>你剛剛打的請求\n<pre>#{JSON.pretty_generate(env)}</pre>"
    [status, headers, body]
  end
end

use MyMiddleware
run(Proc.new {|_env| [200, {'Content-Type'=>'text/html; charset=utf-8'}, ['我剛剛前面有放一個 middleware']] })
