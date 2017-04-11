
~~~INT~~~

~~~INT~~~
; ModuleID = 'MicroC'

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %cond_result = call i32 @cond(i1 true)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %cond_result)
  %cond_result1 = call i32 @cond(i1 false)
  %printf2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %cond_result1)
  ret i32 0
}

define i32 @cond(i1 %b) {
entry:
  %b1 = alloca i1
  store i1 %b, i1* %b1
  %x = alloca i32
  %b2 = load i1, i1* %b1
  br i1 %b2, label %then, label %else

merge:                                            ; preds = %else, %then
  %x3 = load i32, i32* %x
  ret i32 %x3

then:                                             ; preds = %entry
  store i32 42, i32* %x
  br label %merge

else:                                             ; preds = %entry
  store i32 17, i32* %x
  br label %merge
}
