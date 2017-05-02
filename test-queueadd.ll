; ModuleID = 'MicroC'

%struct.QueueId = type { %struct.Node*, %struct.Node*, i32 }
%struct.Node = type { i8*, %struct.Node* }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

declare %struct.QueueId* @initQueueId()

declare void @enqueue(%struct.QueueId*, i8*)

declare void @dequeue(%struct.QueueId*)

declare i8* @front(%struct.QueueId*)

define i32 @main() {
entry:
  %a = alloca i32
  %b = alloca i32
  %c = alloca i32
  %q = alloca %struct.QueueId*
  store i32 3, i32* %a
  store i32 5, i32* %c
  %init = call %struct.QueueId* @initQueueId()
  store %struct.QueueId* %init, %struct.QueueId** %q
  %q1 = load %struct.QueueId*, %struct.QueueId** %q
  %a2 = load i32, i32* %a
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to i32*
  store i32 %a2, i32* %tmp
  %ptr = bitcast i32* %tmp to i8*
  call void @enqueue(%struct.QueueId* %q1, i8* %ptr)
  %q3 = load %struct.QueueId*, %struct.QueueId** %q
  %val_ptr = call i8* @front(%struct.QueueId* %q3)
  %d_ptr = bitcast i8* %val_ptr to i32*
  %d_ptr4 = load i32, i32* %d_ptr
  store i32 %d_ptr4, i32* %b
  %q5 = load %struct.QueueId*, %struct.QueueId** %q
  call void @dequeue(%struct.QueueId* %q5)
  %b6 = load i32, i32* %b
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %b6)
  ret i32 0
}

declare noalias i8* @malloc(i32)
