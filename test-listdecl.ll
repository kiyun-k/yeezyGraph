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
  %i = alloca %struct.List*
  %init = call %struct.List* @l_init()
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to i32*
  store i32 1, i32* %tmp
  %ptr = bitcast i32* %tmp to i8*
  call void @l_add(%struct.List* %init, i8* %ptr)
  %malloccall1 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp2 = bitcast i8* %malloccall1 to i32*
  store i32 2, i32* %tmp2
  %ptr3 = bitcast i32* %tmp2 to i8*
  call void @l_add(%struct.List* %init, i8* %ptr3)
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp5 = bitcast i8* %malloccall4 to i32*
  store i32 3, i32* %tmp5
  %ptr6 = bitcast i32* %tmp5 to i8*
  call void @l_add(%struct.List* %init, i8* %ptr6)
  store %struct.List* %init, %struct.List** %i
  ret i32 0
}

declare noalias i8* @malloc(i32)
