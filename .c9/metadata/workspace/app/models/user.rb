{"filter":false,"title":"user.rb","tooltip":"/app/models/user.rb","undoManager":{"mark":50,"position":50,"stack":[[{"group":"doc","deltas":[{"start":{"row":4,"column":76},"end":{"row":5,"column":0},"action":"insert","lines":["",""]},{"start":{"row":5,"column":0},"end":{"row":5,"column":9},"action":"insert","lines":["         "]}]}],[{"group":"doc","deltas":[{"start":{"row":5,"column":9},"end":{"row":6,"column":0},"action":"insert","lines":["",""]},{"start":{"row":6,"column":0},"end":{"row":6,"column":9},"action":"insert","lines":["         "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":8},"end":{"row":6,"column":9},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":6},"end":{"row":6,"column":8},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":4},"end":{"row":6,"column":6},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":2},"end":{"row":6,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":2},"end":{"row":11,"column":5},"action":"insert","lines":["  enum role: [:user, :vip, :admin]","  after_initialize :set_default_role, :if => :new_record?","","  def set_default_role","    self.role ||= :user","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":2},"end":{"row":6,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":22},"end":{"row":6,"column":25},"action":"remove","lines":["vip"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":22},"end":{"row":6,"column":23},"action":"remove","lines":[","]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":21},"end":{"row":6,"column":22},"action":"remove","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":20},"end":{"row":6,"column":21},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":27},"end":{"row":6,"column":28},"action":"insert","lines":[","]},{"start":{"row":6,"column":28},"end":{"row":6,"column":29},"action":"insert","lines":["."]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":28},"end":{"row":6,"column":29},"action":"remove","lines":["."]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":28},"end":{"row":6,"column":29},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":29},"end":{"row":6,"column":30},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":30},"end":{"row":6,"column":31},"action":"insert","lines":["g"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":31},"end":{"row":6,"column":32},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":32},"end":{"row":6,"column":33},"action":"insert","lines":["l"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":33},"end":{"row":6,"column":34},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":34},"end":{"row":6,"column":35},"action":"insert","lines":[","]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":35},"end":{"row":6,"column":36},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":35},"end":{"row":6,"column":36},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":6,"column":34},"end":{"row":6,"column":35},"action":"remove","lines":[","]}]}],[{"group":"doc","deltas":[{"start":{"row":0,"column":31},"end":{"row":1,"column":0},"action":"insert","lines":["",""]},{"start":{"row":1,"column":0},"end":{"row":1,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":2},"end":{"row":2,"column":0},"action":"insert","lines":["",""]},{"start":{"row":2,"column":0},"end":{"row":2,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":2},"end":{"row":1,"column":3},"action":"insert","lines":["h"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":3},"end":{"row":1,"column":4},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":4},"end":{"row":1,"column":5},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":5},"end":{"row":1,"column":6},"action":"insert","lines":["_"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":6},"end":{"row":1,"column":7},"action":"insert","lines":["m"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":7},"end":{"row":1,"column":8},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":8},"end":{"row":1,"column":9},"action":"insert","lines":["n"]},{"start":{"row":1,"column":9},"end":{"row":1,"column":10},"action":"insert","lines":["y"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":10},"end":{"row":1,"column":11},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":10},"end":{"row":1,"column":11},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":10},"end":{"row":1,"column":11},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":11},"end":{"row":1,"column":12},"action":"insert","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":12},"end":{"row":1,"column":13},"action":"insert","lines":[":"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":13},"end":{"row":1,"column":14},"action":"insert","lines":["a"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":14},"end":{"row":1,"column":15},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":15},"end":{"row":1,"column":16},"action":"insert","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":15},"end":{"row":1,"column":16},"action":"remove","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":14},"end":{"row":1,"column":15},"action":"remove","lines":["d"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":14},"end":{"row":1,"column":15},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":15},"end":{"row":1,"column":16},"action":"insert","lines":["c"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":16},"end":{"row":1,"column":17},"action":"insert","lines":["o"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":17},"end":{"row":1,"column":18},"action":"insert","lines":["u"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":18},"end":{"row":1,"column":19},"action":"insert","lines":["n"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":19},"end":{"row":1,"column":20},"action":"insert","lines":["t"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":20},"end":{"row":1,"column":21},"action":"insert","lines":["s"]}]}],[{"group":"doc","deltas":[{"start":{"row":1,"column":10},"end":{"row":1,"column":11},"action":"remove","lines":[":"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":1,"column":10},"end":{"row":1,"column":10},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1421841104792,"hash":"1c2896d610cad804fc70115fd0d3744449d498a3"}