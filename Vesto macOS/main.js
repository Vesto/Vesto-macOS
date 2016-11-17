QKLogger.output("Parent " + parentView + "\n")

//parentView.rect = new Rect(new Point(10, 10), new Size(100, 100))

var button = new QKButton()
button.rect = new QKRect(new QKPoint(10, 10), new QKSize(100, 100))
button.shadow = new QKShadow(new QKPoint(0, 0), 10, new QKColor(0, 1, 0, 1))
button.backgroundColor = new QKColor(1,0,0,0.5)
button.title = "hi"
parentView.addSubview(button)
