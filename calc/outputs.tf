output "result" {
  value = "${var.operation == "" ? "enter valid operation" :
             var.operation == "sum" ? var.one + var.two :
             var.operation == "mul" ? var.one * var.two :
             var.operation == "dec" ? var.one - var.two :
             var.operation == "div" ? var.one / var.two : "err"}"
}
