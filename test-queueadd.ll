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
  %a = alloca double
  %b = alloca double
  %q = alloca %struct.QueueId*
  %init = call %struct.QueueId* @initQueueId()
  store %struct.QueueId* %init, %struct.QueueId** %q
  store double 3.100000e+00, double* %a
  %q1 = load %struct.QueueId*, %struct.QueueId** %q
  %a2 = load double, double* %a
  %malloccall = tail call i8* @malloc(i32 ptrtoint (double* getelementptr (double, double* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to double*
  store double %a2, double* %tmp
  %ptr = bitcast double* %tmp to i8*
  call void @enqueue(%struct.QueueId* %q1, i8* %ptr)
  %q3 = load %struct.QueueId*, %struct.QueueId** %q
  %val_ptr = call i8* @front(%struct.QueueId* %q3)
  %d_ptr = bitcast i8* %val_ptr to double*
  %d_ptr4 = load double, double* %d_ptr
  store double %d_ptr4, double* %b
  %b5 = load double, double* %b
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), double %b5)
  ret i32 0
}

declare noalias i8* @malloc(i32)
