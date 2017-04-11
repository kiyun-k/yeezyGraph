
~~~INT~~~

~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  call void @foo(i1 true)
  ret i32 0
}

define void @foo(i1 %i) {
entry:
  %i1 = alloca i1
  store i1 %i, i1* %i1
  %i2 = alloca i32
  store i32 42, i32* %i2
  %i3 = load i32, i32* %i2
  %i4 = load i32, i32* %i2
  %tmp = add i32 %i3, %i4
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i32 %tmp)
  ret void
}
