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
@str6 = private unnamed_addr constant [4 x i8] c"ghi\00"

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
  %p = alloca %struct.pqueue*
  %g1 = alloca %struct.graph*
  %a1 = alloca i8*
  %a2 = alloca i8*
  %a3 = alloca i8*
  %n1 = alloca %struct.node*
  %n2 = alloca %struct.node*
  %n3 = alloca %struct.node*
  %init = call %struct.graph* @g_init()
  store %struct.graph* %init, %struct.graph** %g1
  store i8* getelementptr inbounds ([4 x i8]* @str, i32 0, i32 0), i8** %a1
  store i8* getelementptr inbounds ([4 x i8]* @str5, i32 0, i32 0), i8** %a2
  store i8* getelementptr inbounds ([4 x i8]* @str6, i32 0, i32 0), i8** %a3
  %char_n_val_pointer = load i8** %a1
  %init1 = call %struct.node* @n_init(i8* %char_n_val_pointer)
  %node_alloca = alloca %struct.node*
  store %struct.node* %init1, %struct.node** %node_alloca
  %graph_pointer = load %struct.graph** %g1
  %node_pointer = load %struct.node** %node_alloca
  call void @addNode(%struct.graph* %graph_pointer, %struct.node* %node_pointer)
  %char_n_val_pointer2 = load i8** %a2
  %init3 = call %struct.node* @n_init(i8* %char_n_val_pointer2)
  %node_alloca4 = alloca %struct.node*
  store %struct.node* %init3, %struct.node** %node_alloca4
  %graph_pointer5 = load %struct.graph** %g1
  %node_pointer6 = load %struct.node** %node_alloca4
  call void @addNode(%struct.graph* %graph_pointer5, %struct.node* %node_pointer6)
  %char_n_val_pointer7 = load i8** %a3
  %init8 = call %struct.node* @n_init(i8* %char_n_val_pointer7)
  %node_alloca9 = alloca %struct.node*
  store %struct.node* %init8, %struct.node** %node_alloca9
  %graph_pointer10 = load %struct.graph** %g1
  %node_pointer11 = load %struct.node** %node_alloca9
  call void @addNode(%struct.graph* %graph_pointer10, %struct.node* %node_pointer11)
  %g112 = load %struct.graph** %g1
  %char_n_val_pointer13 = load i8** %a1
  %0 = call %struct.node* @getNode(%struct.graph* %g112, i8* %char_n_val_pointer13)
  store %struct.node* %0, %struct.node** %n1
  %n114 = load %struct.node** %n1
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32* null, i32 1) to i32))
  %tmp = bitcast i8* %malloccall to i32*
  store i32 3, i32* %tmp
  %ptr = bitcast i32* %tmp to i8*
  call void @set_data(%struct.node* %n114, i8* %ptr)
  ret i32 0
}

declare noalias i8* @malloc(i32)
