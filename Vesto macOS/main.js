Logger.output("Hi there\n")
Logger.output("Parent " + parentView + "\n")

parentView.rect = new Rect(new Point(10, 10), new Size(100, 100))

var button = new View()
button.rect = new Rect(new Point(0, 0), new Size(100, 100))
//button.title = "hi"

parentView.addSubview(button)
