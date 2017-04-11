
~~~INT~~~

~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %a = alloca i32
  store i32 42, i32* %a
  %a1 = load i32, i32* %a
  %tmp = add i32 %a1, 5
  store i32 %tmp, i32* %a
  %a2 = load i32, i32* %a
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %a2)
  ret i32 0
}

define i32 @foo(i32 %a) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %a2 = load i32, i32* %a1
  ret i32 %a2
}
