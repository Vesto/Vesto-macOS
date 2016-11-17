Logger.output("Parent " + parentView + "\n")

//parentView.rect = new Rect(new Point(10, 10), new Size(100, 100))

var button = new Button()
button.rect = new Rect(new Point(10, 10), new Size(100, 100))
button.shadow = new Shadow(new Point(0, 0), 10, new Color(0, 1, 0, 1))
button.backgroundColor = new Color(1,0,0,0.5)
button.title = "hi"
parentView.addSubview(button)
