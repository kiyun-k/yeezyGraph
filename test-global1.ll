
~~~INT~~~

~~~INT~~~

~~~INT~~~

~~~INT~~~
; ModuleID = 'MicroC'

@b = global i32 0
@a = global i32 0
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  store i32 42, i32* @a
  store i32 21, i32* @b
  call void @printa()
  call void @printb()
  call void @incab()
  call void @printa()
  call void @printb()
  ret i32 0
}

define void @incab() {
entry:
  %a = load i32, i32* @a
  %tmp = add i32 %a, 1
  store i32 %tmp, i32* @a
  %b = load i32, i32* @b
  %tmp1 = add i32 %b, 1
  store i32 %tmp1, i32* @b
  ret void
}

define void @printb() {
entry:
  %b = load i32, i32* @b
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i32 %b)
  ret void
}

define void @printa() {
entry:
  %a = load i32, i32* @a
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.3, i32 0, i32 0), i32 %a)
  ret void
}
