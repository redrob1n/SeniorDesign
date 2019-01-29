var loopsJSON={
  "columns":["Pipelined", "II", "Bottleneck"]
  , "functions":
  [
  ]
}
;var mavJSON={
  "nodes":
  [
    {
      "type":"kernel"
      , "id":10
      , "name":"vadd"
      , "file":""
      , "line":"0"
      , "children":[
        {
          "type":"bb"
          , "id":3
          , "name":"Block0"
          , "file":""
          , "line":"0"
          , "children":[
            {
              "type":"inst"
              , "id":4
              , "name":"Load"
              , "file":"1"
              , "line":"10"
              , "details":
              {
                "Width":"128 bits"
                , "Type":"Burst-coalesced"
                , "Stall-free":"No"
                , "Start-Cycle":"2"
                , "Latency":"160"
              }
            }
            , {
              "type":"inst"
              , "id":5
              , "name":"Load"
              , "file":"1"
              , "line":"10"
              , "details":
              {
                "Width":"128 bits"
                , "Type":"Burst-coalesced"
                , "Stall-free":"No"
                , "Start-Cycle":"2"
                , "Latency":"160"
              }
            }
            , {
              "type":"inst"
              , "id":6
              , "name":"Store"
              , "file":"1"
              , "line":"10"
              , "details":
              {
                "Width":"128 bits"
                , "Type":"Burst-coalesced"
                , "Stall-free":"No"
                , "Start-Cycle":"176"
                , "Latency":"4"
              }
            }
            , {
              "type":"inst"
              , "id":7
              , "name":"end"
              , "file":"1"
              , "line":"11"
              , "details":
              {
                "Start-Cycle":"180"
                , "Latency":"1"
                , "Additional Info":"Exit from a basic block. Control flow branches at this node to one or more merge nodes. There is no control branching between merge and branch node for the same basic block."
              }
            }
            , {
              "type":"inst"
              , "id":8
              , "name":"begin"
              , "file":""
              , "line":""
              , "details":
              {
                "Start-Cycle":"0"
                , "Latency":"1"
                , "Additional Info":"Entrance to a basic block. Control flow comes to this node from one or more branch nodes, unless it's the very first merge node in a kernel. There is no control branching between merge and branch node within the same basic block."
              }
            }
          ]
          , "details":
          {
            "Latency":"181"
          }
        }
      ]
    }
    , {
      "type":"memtype"
      , "id":11
      , "name":"Global Memory"
      , "file":""
      , "line":"0"
      , "children":[
        {
          "type":"memsys"
          , "id":12
          , "name":""
          , "file":""
          , "line":"0"
          , "replFactor":"0"
          , "banks":2
          , "pumping":0
          , "children":[
            {
              "type":"bank"
              , "id":13
              , "name":"Bank 0"
              , "file":""
              , "line":"0"
            }
            , {
              "type":"bank"
              , "id":14
              , "name":"Bank 1"
              , "file":""
              , "line":"0"
            }
          ]
        }
      ]
    }
  ]
  ,
  "links":
  [
    {
      "from":8
      , "to":5
    }
    ,
    {
      "from":8
      , "to":4
    }
    ,
    {
      "from":4
      , "to":6
    }
    ,
    {
      "from":5
      , "to":6
    }
    ,
    {
      "from":6
      , "to":7
    }
    ,
    {
      "from":13
      , "to":5
    }
    ,
    {
      "from":14
      , "to":5
    }
    ,
    {
      "from":13
      , "to":4
    }
    ,
    {
      "from":14
      , "to":4
    }
    ,
    {
      "from":6
      , "to":13
    }
    ,
    {
      "from":6
      , "to":14
    }
  ]
  , "fileIndexMap":
  {
    "/home/facstaff/wells/.black_hole/gpu/.old_stuff/opencl_altera/vec_add_class_example/vadd.cl":"1"
  }
}
;var areaJSON={
  "columns":["ALUTs", "FFs", "RAMs", "DSPs"]
  , "debug_enabled":1
  , "total_percent":
  [18.2827, 11.2466, 8.01189, 15.9375, 0]
  , "total":
  [52796, 75222, 408, 0]
  , "name":"Kernel System"
  , "max_resources":
  [469440, 938880, 2560, 256]
  , "partitions":
  [
  ]
  , "resources":
  [
    {
      "name":"Board interface"
      , "data":
      [39076, 51471, 283, 0]
      , "details":
      [
        "Platform interface logic."
      ]
    }
    , {
      "name":"Global interconnect"
      , "data":
      [8779, 12545, 78, 0]
      , "details":
      [
        "Global interconnect for 2 global loads and 1 global store. Reduce number of global loads and stores to simplify global interconnect."
      ]
    }
  ]
  , "functions":
  [
    {
      "name":"vadd"
      , "compute_units":1
      , "details":
      [
        "Achieved kernel vectorization: 4"
        , "Number of compute units: 1"
      ]
      , "resources":
      [
        {
          "name":"Function overhead"
          , "data":
          [1570, 1685, 0, 0]
          , "details":
          [
            "Kernel dispatch logic."
          ]
        }
      ]
      , "basicblocks":
      [
        {
          "name":"Block0"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [1068, 2565, 3, 0]
              , "details":
              [
                "Resources for live values and control logic. To reduce this area:\n- reduce size of local variables\n- reduce scope of local variables, localizing them as much as possible\n- reduce number of nested loops"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Control flow logic"
                    , "data":
                    [32, 32, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [90.4, 617.8, 2, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"vadd.cl:10"
                    , "data":
                    [945.6, 1915.2, 1, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/facstaff/wells/.black_hole/gpu/.old_stuff/opencl_altera/vec_add_class_example/vadd.cl"
                          , "line":10
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
            , {
              "name":"Cluster logic"
              , "data":
              [474, 758, 2, 0]
              , "details":
              [
                "Logic required to efficiently support sets of operations that do not stall. This area cannot be affected directly."
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"vadd.cl:10"
              , "data":
              [1829, 6198, 42, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/facstaff/wells/.black_hole/gpu/.old_stuff/opencl_altera/vec_add_class_example/vadd.cl"
                    , "line":10
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Add"
                    , "data":
                    [116, 0, 0, 0]
                  }
                  , "count":16
                }
                , {
                  "info":
                  {
                    "name":"And"
                    , "data":
                    [24, 0, 0, 0]
                  }
                  , "count":247
                }
                , {
                  "info":
                  {
                    "name":"Integer Compare"
                    , "data":
                    [176, 0, 0, 0]
                  }
                  , "count":108
                }
                , {
                  "info":
                  {
                    "name":"Load"
                    , "data":
                    [874, 3938, 26, 0]
                  }
                  , "count":2
                }
                , {
                  "info":
                  {
                    "name":"Or"
                    , "data":
                    [96, 0, 0, 0]
                  }
                  , "count":96
                }
                , {
                  "info":
                  {
                    "name":"Pointer Computation"
                    , "data":
                    [93, 0, 0, 0]
                  }
                  , "count":3
                }
                , {
                  "info":
                  {
                    "name":"Store"
                    , "data":
                    [354, 2260, 16, 0]
                  }
                  , "count":1
                }
                , {
                  "info":
                  {
                    "name":"Sub"
                    , "data":
                    [24, 0, 0, 0]
                  }
                  , "count":8
                }
                , {
                  "info":
                  {
                    "name":"Xor"
                    , "data":
                    [72, 0, 0, 0]
                  }
                  , "count":52
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
;var fileJSON=[{"index":0, "path":"/home/facstaff/wells/.black_hole/gpu/.old_stuff/opencl_altera/vec_add_class_example/vadd.cl", "name":"vadd.cl", "content":"#define TILE_WIDTH 256\012\012// kernel program (vector add) \012 __kernel\012   __attribute((reqd_work_group_size(TILE_WIDTH,1,1)))\012   __attribute((num_vector_lanes(4)))\012   void vadd(__global const float *restrict a,\012      __global const float *restrict b, global float *restrict result, const int N) { \012         int id = get_global_id(0); \012         if (id < N) result[id] = a[id] + b[id];\012   }\012"}];