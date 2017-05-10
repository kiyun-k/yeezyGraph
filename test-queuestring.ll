; ModuleID = 'MicroC'

%struct.QueueId = type { %struct.Node*, %struct.Node*, i32 }
%struct.Node = type { i8*, %struct.Node* }
%struct.List = type { %struct.ListNode*, i32 }
%struct.ListNode = type { i8*, %struct.ListNode* }
%struct.pqueue = type { %struct.node**, i32, i32 }
%struct.node = type { i8*, i8, %struct.map*, %struct.map*, i8* }
%struct.map = type { i32, i32, i8**, i32* }
%struct.graph = type { %struct.List.5*, i32 }
%struct.List.5 = type { %struct.ListNode.4*, i32 }
%struct.ListNode.4 = type { i8*, %struct.ListNode.4* }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt2 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt3 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt4 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@str = private unnamed_addr constant [4 x i8] c"abc\00"
@str5 = private unnamed_addr constant [4 x i8] c"def\00"

declare i32 @printf(i8*, ...)

declare %struct.QueueId* @initQueueId()

declare void @enqueue(%struct.QueueId*, i8*)

declare void @dequeue(%struct.QueueId*)

declare i8* @front(%struct.QueueId*)

declare i32 @q_size(%struct.QueueId*)

declare %struct.List* @l_init()

declare void @l_add(%struct.List*, i8*)

declare void @l_delete(%struct.List*, i32)

declare i8* @l_get(%struct.List*, i32)

declare i32 @l_size(%struct.List*)

declare void @print_list(%struct.List*)

declare %struct.pqueue* @pq_init()

declare void @pq_push(%struct.pqueue*, %struct.node*)

declare %struct.node* @pq_delete(%struct.pqueue*)

declare i32 @p_size(%struct.pqueue*)

declare %struct.node* @n_init(i8*)

declare void @set_data(%struct.node*, i8*)

declare i8* @get_name(%struct.node*)

declare i1 @get_visited(%struct.node*)

declare void @modify_visited(%struct.node*, i1)

declare i8* @get_data(%struct.node*)

declare %struct.List* @get_inNodes(%struct.node*)

declare %struct.List* @get_outNodes(%struct.node*)

declare %struct.graph* @g_init()

declare void @addNode(%struct.graph*, %struct.node*)

declare void @removeNode(%struct.graph*, %struct.node*)

declare void @addEdge(%struct.graph*, %struct.node*, %struct.node*, i32)

declare void @removeEdge(%struct.graph*, %struct.node*, %struct.node*)

declare void @printGraph(%struct.graph*)

declare i1 @isEmpty(%struct.graph*)

declare i32 @size(%struct.graph*)

declare i1 @contains(%struct.graph*, i8*)

declare %struct.node* @getNode(%struct.graph*, i8*)

declare i32 @getWeight(%struct.graph*, %struct.node*, %struct.node*)

define i32 @main() {
entry:
  %a = alloca i8*
  %b = alloca i8*
  %c = alloca i8*
  %d = alloca i8*
  %q = alloca %struct.QueueId*
  %init = call %struct.QueueId* @initQueueId()
  store %struct.QueueId* %init, %struct.QueueId** %q
  store i8* getelementptr inbounds ([4 x i8]* @str, i32 0, i32 0), i8** %a
  store i8* getelementptr inbounds ([4 x i8]* @str5, i32 0, i32 0), i8** %b
  %q1 = load %struct.QueueId** %q
  %a2 = load i8** %a
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to i8**
  store i8* %a2, i8** %tmp
  %ptr = bitcast i8** %tmp to i8*
  call void @enqueue(%struct.QueueId* %q1, i8* %ptr)
  %q3 = load %struct.QueueId** %q
  %b4 = load i8** %b
  %malloccall5 = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1** null, i32 1) to i32))
  %tmp6 = bitcast i8* %malloccall5 to i8**
  store i8* %b4, i8** %tmp6
  %ptr7 = bitcast i8** %tmp6 to i8*
  call void @enqueue(%struct.QueueId* %q3, i8* %ptr7)
  %q8 = load %struct.QueueId** %q
  %val_ptr = call i8* @front(%struct.QueueId* %q8)
  %d_ptr = bitcast i8* %val_ptr to i8**
  %d_ptr9 = load i8** %d_ptr
  store i8* %d_ptr9, i8** %c
  %c10 = load i8** %c
  %printf = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt1, i32 0, i32 0), i8* %c10)
  %q11 = load %struct.QueueId** %q
  call void @dequeue(%struct.QueueId* %q11)
  %q12 = load %struct.QueueId** %q
  %val_ptr13 = call i8* @front(%struct.QueueId* %q12)
  %d_ptr14 = bitcast i8* %val_ptr13 to i8**
  %d_ptr15 = load i8** %d_ptr14
  store i8* %d_ptr15, i8** %d
  %d16 = load i8** %d
  %printf17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @fmt1, i32 0, i32 0), i8* %d16)
  ret i32 0
}

declare noalias i8* @malloc(i32)
