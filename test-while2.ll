
~~~INT~~~

~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %foo_result = call i32 @foo(i32 7)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %foo_result)
  ret i32 0
}

define i32 @foo(i32 %a) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %j = alloca i32
  store i32 0, i32* %j
  br label %while

while:                                            ; preds = %while_body, %entry
  %a5 = load i32, i32* %a1
  %tmp6 = icmp sgt i32 %a5, 0
  br i1 %tmp6, label %while_body, label %merge

while_body:                                       ; preds = %while
  %j2 = load i32, i32* %j
  %tmp = add i32 %j2, 2
  store i32 %tmp, i32* %j
  %a3 = load i32, i32* %a1
  %tmp4 = sub i32 %a3, 1
  store i32 %tmp4, i32* %a1
  br label %while

merge:                                            ; preds = %while
  %j7 = load i32, i32* %j
  ret i32 %j7
}
