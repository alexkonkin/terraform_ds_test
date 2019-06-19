data "external" "numbers" {
    program = ["bash", "script.sh"]
}

resource "null_resource" "test" {
  count = 5
  triggers = {
    val1 = "${element(split(" ",element(split(",",data.external.numbers.result.data),count.index)),0)}"
    val2 = "${element(split(" ",element(split(",",data.external.numbers.result.data),count.index)),1)}"
    val3 = "${element(split(" ",element(split(",",data.external.numbers.result.data),count.index)),0)}" + "${element(split(" ",element(split(",",data.external.numbers.result.data),count.index)),1)}"
  }
}

module "calc1" {
  source = "./calc"
  operation = "${var.operation}"
  one = "${null_resource.test[0].triggers.val1}"
  two = "${null_resource.test[0].triggers.val2}"
}

module "calc2" {
  source = "./calc"
  operation = "${var.operation}"
  one = "${null_resource.test[1].triggers.val1}"
  two = "${null_resource.test[1].triggers.val2}"
}
