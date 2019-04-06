var loopsJSON={
  "columns":["Pipelined", "II", "Bottleneck"]
  , "functions":
  [
    {
      "name":"Block1"
      , "data":
      ["No", "n/a", "n/a"]
      , "debug":
      [
        [
          {
            "filename":"single_kernel.cl"
            , "line":42
            , "level":0
          }
        ]
      ]
      , "details":
      [
        "Out-of-order inner loop"      ]
      , "resources":
      [
        {
          "name":"Loop iteration ordering: iterations of inner loop shown may get out of order:"
          , "subinfos":
          [
            {
              "info":
              {
                "name":"Block6"
                , "debug":
                [
                  [
                    {
                      "filename":"single_kernel.cl"
                      , "line":88
                    }
                  ]
                ]
              }
            }
          ]
        }
        , {
          "name":"See Nested Loops for more information."
        }
      ]
    }
    , {
      "name":"Block4"
      , "data":
      ["Yes", "1", "n/a"]
      , "debug":
      [
        [
          {
            "filename":"single_kernel.cl"
            , "line":54
            , "level":1
          }
        ]
      ]
    }
    , {
      "name":"Block2"
      , "data":
      ["Yes", "1", "n/a"]
      , "debug":
      [
        [
          {
            "filename":"single_kernel.cl"
            , "line":82
            , "level":1
          }
        ]
      ]
    }
    , {
      "name":"Block6"
      , "data":
      ["Yes", "1", "n/a"]
      , "debug":
      [
        [
          {
            "filename":"single_kernel.cl"
            , "line":88
            , "level":1
          }
        ]
      ]
    }
    , {
      "name":"Block3"
      , "data":
      ["Yes", "1", "n/a"]
      , "debug":
      [
        [
          {
            "filename":"single_kernel.cl"
            , "line":94
            , "level":1
          }
        ]
      ]
    }
  ]
}
;var mavJSON={
  "nodes":
  [
    {
      "type":"kernel"
      , "id":29
      , "name":"genetic_algorithm"
      , "file":""
      , "line":"0"
      , "children":[
        {
          "type":"bb"
          , "id":3
          , "name":"Block0.wii_blk"
          , "file":""
          , "line":"0"
          , "details":
          {
            "Latency":"5"
          }
        }
        , {
          "type":"bb"
          , "id":4
          , "name":"Block1"
          , "file":""
          , "line":"0"
          , "II":1
          , "LoopInfo":"Entry to loop. "
          , "hasFmaxBottlenecks":"No"
          , "hasSubloops":"Yes"
          , "isPipelined":"No"
          , "loopTo":10
          , "details":
          {
            "Latency":"3"
          }
        }
        , {
          "type":"bb"
          , "id":5
          , "name":"Block2"
          , "file":""
          , "line":"0"
          , "II":1
          , "LoopInfo":""
          , "hasFmaxBottlenecks":"No"
          , "hasSubloops":"No"
          , "isPipelined":"Yes"
          , "children":[
            {
              "type":"inst"
              , "id":12
              , "name":"Load"
              , "file":"1"
              , "line":"83"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Prefetching"
                , "Stall-free":"No"
                , "Start-Cycle":"3"
                , "Latency":"3"
              }
            }
            , {
              "type":"inst"
              , "id":13
              , "name":"Store"
              , "file":"1"
              , "line":"83"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Pipelined"
                , "Stall-free":"Yes"
                , "Start-Cycle":"6"
                , "Latency":"2"
              }
            }
            , {
              "type":"inst"
              , "id":14
              , "name":"loop end"
              , "file":"1"
              , "line":"82"
              , "details":
              {
                "Start-Cycle":"8"
                , "Latency":"1"
                , "Additional Info":"Exit from a basic block. Control flow branches at this node to one or more merge nodes. There is no control branching between merge and branch node for the same basic block."
              }
            }
            , {
              "type":"inst"
              , "id":15
              , "name":"loop"
              , "file":""
              , "line":""
              , "loopTo":14
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
            "Latency":"9"
          }
        }
        , {
          "type":"bb"
          , "id":6
          , "name":"Block3"
          , "file":""
          , "line":"0"
          , "II":1
          , "LoopInfo":""
          , "hasFmaxBottlenecks":"No"
          , "hasSubloops":"No"
          , "isPipelined":"Yes"
          , "children":[
            {
              "type":"inst"
              , "id":16
              , "name":"Load"
              , "file":"1"
              , "line":"95"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Pipelined"
                , "Stall-free":"Yes"
                , "Start-Cycle":"3"
                , "Latency":"4"
                , "Additional Info":" Part of a stall-free cluster."
              }
            }
            , {
              "type":"inst"
              , "id":17
              , "name":"Store"
              , "file":"1"
              , "line":"95"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Pipelined"
                , "Stall-free":"Yes"
                , "Start-Cycle":"7"
                , "Latency":"3"
                , "Additional Info":" Part of a stall-free cluster."
              }
            }
            , {
              "type":"inst"
              , "id":18
              , "name":"loop end"
              , "file":"1"
              , "line":"94"
              , "details":
              {
                "Start-Cycle":"15"
                , "Latency":"1"
                , "Additional Info":"Exit from a basic block. Control flow branches at this node to one or more merge nodes. There is no control branching between merge and branch node for the same basic block."
              }
            }
            , {
              "type":"inst"
              , "id":19
              , "name":"loop"
              , "file":""
              , "line":""
              , "loopTo":18
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
            "Latency":"16"
          }
        }
        , {
          "type":"bb"
          , "id":7
          , "name":"Block4"
          , "file":""
          , "line":"0"
          , "II":1
          , "LoopInfo":""
          , "hasFmaxBottlenecks":"No"
          , "hasSubloops":"No"
          , "isPipelined":"Yes"
          , "children":[
            {
              "type":"inst"
              , "id":20
              , "name":"Load"
              , "file":"1"
              , "line":"54"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Pipelined"
                , "Stall-free":"Yes"
                , "Start-Cycle":"3"
                , "Latency":"4"
                , "Additional Info":" Part of a stall-free cluster."
              }
            }
            , {
              "type":"inst"
              , "id":21
              , "name":"Store"
              , "file":"1"
              , "line":"54"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Burst-coalesced"
                , "Stall-free":"No"
                , "Start-Cycle":"12"
                , "Latency":"4"
              }
            }
            , {
              "type":"inst"
              , "id":22
              , "name":"loop end"
              , "file":"1"
              , "line":"54"
              , "details":
              {
                "Start-Cycle":"16"
                , "Latency":"1"
                , "Additional Info":"Exit from a basic block. Control flow branches at this node to one or more merge nodes. There is no control branching between merge and branch node for the same basic block."
              }
            }
            , {
              "type":"inst"
              , "id":23
              , "name":"loop"
              , "file":""
              , "line":""
              , "loopTo":22
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
            "Latency":"17"
          }
        }
        , {
          "type":"bb"
          , "id":8
          , "name":"Block5"
          , "file":""
          , "line":"0"
          , "details":
          {
            "Latency":"3"
          }
        }
        , {
          "type":"bb"
          , "id":9
          , "name":"Block6"
          , "file":""
          , "line":"0"
          , "II":1
          , "LoopInfo":""
          , "hasFmaxBottlenecks":"No"
          , "hasSubloops":"No"
          , "isPipelined":"Yes"
          , "children":[
            {
              "type":"inst"
              , "id":24
              , "name":"Load"
              , "file":"1"
              , "line":"89"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Pipelined"
                , "Stall-free":"Yes"
                , "Start-Cycle":"3"
                , "Latency":"5"
                , "Additional Info":" Part of a stall-free cluster."
              }
            }
            , {
              "type":"inst"
              , "id":25
              , "name":"Store"
              , "file":"1"
              , "line":"89"
              , "details":
              {
                "Width":"8 bits"
                , "Type":"Burst-coalesced"
                , "Stall-free":"No"
                , "Start-Cycle":"13"
                , "Latency":"4"
              }
            }
            , {
              "type":"inst"
              , "id":26
              , "name":"loop end"
              , "file":"1"
              , "line":"88"
              , "details":
              {
                "Start-Cycle":"17"
                , "Latency":"1"
                , "Additional Info":"Exit from a basic block. Control flow branches at this node to one or more merge nodes. There is no control branching between merge and branch node for the same basic block."
              }
            }
            , {
              "type":"inst"
              , "id":27
              , "name":"loop"
              , "file":""
              , "line":""
              , "loopTo":26
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
            "Latency":"18"
          }
        }
        , {
          "type":"bb"
          , "id":10
          , "name":"Block7"
          , "file":""
          , "line":"0"
          , "II":1
          , "LoopInfo":"Exit which branches back to loop. "
          , "hasFmaxBottlenecks":"No"
          , "hasSubloops":"Yes"
          , "isPipelined":"No"
          , "details":
          {
            "Latency":"4"
          }
        }
        , {
          "type":"bb"
          , "id":11
          , "name":"Block8"
          , "file":""
          , "line":"0"
          , "details":
          {
            "Latency":"2"
          }
        }
        , {
          "type":"memtype"
          , "id":30
          , "name":"Local Memory"
          , "file":""
          , "line":"0"
          , "children":[
            {
              "type":"memsys"
              , "id":31
              , "name":"can2"
              , "file":""
              , "line":"0"
              , "replFactor":"1"
              , "banks":1
              , "pumping":1
              , "children":[
                {
                  "type":"bank"
                  , "id":32
                  , "name":"Bank 0"
                  , "file":""
                  , "line":"0"
                }
              ]
            }
            , {
              "type":"memsys"
              , "id":33
              , "name":"parent1"
              , "file":""
              , "line":"0"
              , "replFactor":"1"
              , "banks":1
              , "pumping":1
              , "children":[
                {
                  "type":"bank"
                  , "id":34
                  , "name":"Bank 0"
                  , "file":""
                  , "line":"0"
                }
              ]
            }
          ]
        }
      ]
    }
    , {
      "type":"memtype"
      , "id":35
      , "name":"Global Memory"
      , "file":""
      , "line":"0"
      , "children":[
        {
          "type":"memsys"
          , "id":36
          , "name":""
          , "file":""
          , "line":"0"
          , "replFactor":"0"
          , "banks":2
          , "pumping":0
          , "children":[
            {
              "type":"bank"
              , "id":37
              , "name":"Bank 0"
              , "file":""
              , "line":"0"
            }
            , {
              "type":"bank"
              , "id":38
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
      "from":32
      , "to":16
    }
    ,
    {
      "from":13
      , "to":32
    }
    ,
    {
      "from":34
      , "to":20
    }
    ,
    {
      "from":34
      , "to":24
    }
    ,
    {
      "from":17
      , "to":34
    }
    ,
    {
      "from":12
      , "to":13
    }
    ,
    {
      "from":16
      , "to":17
    }
    ,
    {
      "from":19
      , "to":16
    }
    ,
    {
      "from":23
      , "to":20
    }
    ,
    {
      "from":15
      , "to":12
    }
    ,
    {
      "from":27
      , "to":24
    }
    ,
    {
      "from":24
      , "to":25
    }
    ,
    {
      "from":20
      , "to":21
    }
    ,
    {
      "from":18
      , "to":19
    }
    ,
    {
      "from":14
      , "to":19
    }
    ,
    {
      "from":22
      , "to":8
    }
    ,
    {
      "from":22
      , "to":23
    }
    ,
    {
      "from":18
      , "to":23
    }
    ,
    {
      "from":17
      , "to":18
    }
    ,
    {
      "from":10
      , "to":11
    }
    ,
    {
      "from":26
      , "to":27
    }
    ,
    {
      "from":8
      , "to":27
    }
    ,
    {
      "from":26
      , "to":10
    }
    ,
    {
      "from":14
      , "to":15
    }
    ,
    {
      "from":4
      , "to":15
    }
    ,
    {
      "from":10
      , "to":4
    }
    ,
    {
      "from":3
      , "to":4
    }
    ,
    {
      "from":24
      , "to":26
    }
    ,
    {
      "from":25
      , "to":26
    }
    ,
    {
      "from":13
      , "to":14
    }
    ,
    {
      "from":20
      , "to":22
    }
    ,
    {
      "from":21
      , "to":22
    }
    ,
    {
      "from":37
      , "to":12
    }
    ,
    {
      "from":38
      , "to":12
    }
    ,
    {
      "from":25
      , "to":37
    }
    ,
    {
      "from":25
      , "to":38
    }
    ,
    {
      "from":21
      , "to":37
    }
    ,
    {
      "from":21
      , "to":38
    }
  ]
  , "fileIndexMap":
  {
    "/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl":"1"
  }
}
;var areaJSON={
  "columns":["ALUTs", "FFs", "RAMs", "DSPs"]
  , "debug_enabled":1
  , "total_percent":
  [18.417, 11.3531, 8.05247, 16.2891, 0]
  , "total":
  [53296, 75603, 417, 0]
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
        "Global interconnect for 1 global load and 2 global stores. Reduce number of global loads and stores to simplify global interconnect."
      ]
    }
  ]
  , "functions":
  [
    {
      "name":"genetic_algorithm"
      , "compute_units":1
      , "details":
      [
        "Number of compute units: 1"
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
        , {
          "name":"Private Variable: \n - 'i' (single_kernel.cl:82)"
          , "data":
          [8, 133, 0, 0]
          , "debug":
          [
            [
              {
                "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                , "line":82
              }
            ]
          ]
          , "details":
          [
            "Implemented using registers of the following size:\n- 1 register of width 64 and depth 1"
          ]
        }
        , {
          "name":"Private Variable: \n - 'i' (single_kernel.cl:88)"
          , "data":
          [8, 133, 0, 0]
          , "debug":
          [
            [
              {
                "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                , "line":88
              }
            ]
          ]
          , "details":
          [
            "Implemented using registers of the following size:\n- 1 register of width 64 and depth 1"
          ]
        }
        , {
          "name":"Private Variable: \n - 'i' (single_kernel.cl:94)"
          , "data":
          [40, 197, 0, 0]
          , "debug":
          [
            [
              {
                "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                , "line":94
              }
            ]
          ]
          , "details":
          [
            "Implemented using registers of the following size:\n- 1 register of width 64 and depth 1"
          ]
        }
        , {
          "name":"Private Variable: \n - 'k' (single_kernel.cl:54)"
          , "data":
          [40, 197, 0, 0]
          , "debug":
          [
            [
              {
                "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                , "line":54
              }
            ]
          ]
          , "details":
          [
            "Implemented using registers of the following size:\n- 1 register of width 64 and depth 1"
          ]
        }
        , {
          "name":"single_kernel.cl:36 (parent1)"
          , "data":
          [0, 0, 1, 0]
          , "debug":
          [
            [
              {
                "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                , "line":36
              }
            ]
          ]
          , "details":
          [
            "Private memory implemented in on-chip block RAM."
            , "Private memory: Optimal.\nRequested size 128 bytes (rounded up to nearest power of 2), implemented size 128 bytes, stall-free, 2 reads and 1 write. Additional information:\n- Reducing accesses to exactly one read and one write for all on-chip memory systems may increase overall system performance."
          ]
        }
        , {
          "name":"single_kernel.cl:69 (can2)"
          , "data":
          [0, 0, 1, 0]
          , "debug":
          [
            [
              {
                "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                , "line":69
              }
            ]
          ]
          , "details":
          [
            "Private memory implemented in on-chip block RAM."
            , "Private memory: Optimal.\nRequested size 128 bytes (rounded up to nearest power of 2), implemented size 128 bytes, stall-free, 1 read and 1 write. Additional information:\n- No additional details."
          ]
        }
      ]
      , "basicblocks":
      [
        {
          "name":"Block1"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [25, 309, 0, 0]
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
                    [1, 134, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:42"
                    , "data":
                    [0, 106.667, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":42
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:68"
                    , "data":
                    [0, 21.3333, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":68
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:71 > \nsingle_kernel.cl:82"
                    , "data":
                    [24, 15, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":71
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":82
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:59"
                    , "data":
                    [0, 32, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":59
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"single_kernel.cl:42"
              , "data":
              [19.3333, 0, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":42
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
                    [19.3333, 0, 0, 0]
                  }
                  , "count":2
                }
              ]
            }
            , {
              "name":"single_kernel.cl:43 > single_kernel.cl:68"
              , "data":
              [9.66667, 0, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":43
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":68
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
                    [9.66667, 0, 0, 0]
                  }
                  , "count":1
                }
              ]
            }
          ]
        }
        , {
          "name":"Block2"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [360, 893, 0, 0]
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
                    [1, 1, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [272, 289, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:73 > \nsingle_kernel.cl:82"
                    , "data":
                    [14, 14, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":73
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":82
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:73 > \nsingle_kernel.cl:83"
                    , "data":
                    [73, 589, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":73
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":83
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
            , {
              "name":"Feedback"
              , "data":
              [7, 6, 0, 0]
              , "details":
              [
                "Resources for loop-carried dependencies. To reduce this area:\n- reduce number and size of loop-carried variables"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:73 > \nsingle_kernel.cl:82"
                    , "data":
                    [7, 6, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":73
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":82
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
              [218, 502, 2, 0]
              , "details":
              [
                "Logic required to efficiently support sets of operations that do not stall. This area cannot be affected directly."
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"single_kernel.cl:43 > single_kernel.cl:73 > \nsingle_kernel.cl:82"
              , "data":
              [32, 0, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":43
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":73
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":82
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Integer Compare"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":1
                }
              ]
            }
            , {
              "name":"single_kernel.cl:43 > single_kernel.cl:73 > \nsingle_kernel.cl:83"
              , "data":
              [479, 378, 13, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":43
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":73
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":83
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Load"
                    , "data":
                    [413, 354, 13, 0]
                  }
                  , "count":1
                }
                , {
                  "info":
                  {
                    "name":"Pointer Computation"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":2
                }
                , {
                  "info":
                  {
                    "name":"Store"
                    , "data":
                    [34, 24, 0, 0]
                    , "details":
                    [
                      "Stall-free write to memory declared on single_kernel.cl:69."
                    ]
                  }
                  , "count":1
                }
              ]
            }
          ]
        }
        , {
          "name":"Block3"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [161, 328, 0, 0]
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
                    [1, 1, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [0, 3.5, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:78 > \nsingle_kernel.cl:94"
                    , "data":
                    [32, 67.5, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":78
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":94
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:78 > \nsingle_kernel.cl:95"
                    , "data":
                    [128, 256, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":78
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":95
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
            , {
              "name":"Feedback"
              , "data":
              [7, 6, 0, 0]
              , "details":
              [
                "Resources for loop-carried dependencies. To reduce this area:\n- reduce number and size of loop-carried variables"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"single_kernel.cl:43 > single_kernel.cl:78 > \nsingle_kernel.cl:94"
                    , "data":
                    [7, 6, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":43
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":78
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":94
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
              [218, 502, 2, 0]
              , "details":
              [
                "Logic required to efficiently support sets of operations that do not stall. This area cannot be affected directly."
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"single_kernel.cl:43 > single_kernel.cl:78 > \nsingle_kernel.cl:94"
              , "data":
              [32, 0, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":43
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":78
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":94
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Integer Compare"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":1
                }
              ]
            }
            , {
              "name":"single_kernel.cl:43 > single_kernel.cl:78 > \nsingle_kernel.cl:95"
              , "data":
              [43, 32, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":43
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":78
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":95
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Load"
                    , "data":
                    [9, 8, 0, 0]
                    , "details":
                    [
                      "Stall-free read from memory declared on single_kernel.cl:69."
                    ]
                  }
                  , "count":1
                }
                , {
                  "info":
                  {
                    "name":"Store"
                    , "data":
                    [34, 24, 0, 0]
                    , "details":
                    [
                      "Stall-free write to memory declared on single_kernel.cl:36."
                    ]
                  }
                  , "count":1
                }
              ]
            }
          ]
        }
        , {
          "name":"Block4"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [239, 430, 1, 0]
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
                    [1, 1, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [32, 67.5, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:54"
                    , "data":
                    [206, 361.5, 1, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":54
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
            , {
              "name":"Feedback"
              , "data":
              [7, 6, 0, 0]
              , "details":
              [
                "Resources for loop-carried dependencies. To reduce this area:\n- reduce number and size of loop-carried variables"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"single_kernel.cl:54"
                    , "data":
                    [7, 6, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":54
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
              [218, 502, 2, 0]
              , "details":
              [
                "Logic required to efficiently support sets of operations that do not stall. This area cannot be affected directly."
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"single_kernel.cl:54"
              , "data":
              [639, 2103, 16, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":54
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
                    [32, 0, 0, 0]
                  }
                  , "count":2
                }
                , {
                  "info":
                  {
                    "name":"Integer Compare"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":1
                }
                , {
                  "info":
                  {
                    "name":"Load"
                    , "data":
                    [9, 8, 0, 0]
                    , "details":
                    [
                      "Stall-free read from memory declared on single_kernel.cl:36."
                    ]
                  }
                  , "count":1
                }
                , {
                  "info":
                  {
                    "name":"Pointer Computation"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":2
                }
                , {
                  "info":
                  {
                    "name":"Store"
                    , "data":
                    [534, 2095, 16, 0]
                  }
                  , "count":1
                }
              ]
            }
          ]
        }
        , {
          "name":"Block5"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [24, 49, 0, 0]
              , "details":
              [
                "Resources for live values and control logic. To reduce this area:\n- reduce size of local variables\n- reduce scope of local variables, localizing them as much as possible\n- reduce number of nested loops"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [24, 16, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:58"
                    , "data":
                    [0, 33, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":58
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
          ]
          , "computation":
          [
          ]
        }
        , {
          "name":"Block6"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [141, 271, 0, 0]
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
                    [1, 1, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [96, 195, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:60 > single_kernel.cl:88"
                    , "data":
                    [12, 11, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":60
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":88
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:60 > single_kernel.cl:89"
                    , "data":
                    [32, 64, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":60
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":89
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
            , {
              "name":"Feedback"
              , "data":
              [7, 6, 0, 0]
              , "details":
              [
                "Resources for loop-carried dependencies. To reduce this area:\n- reduce number and size of loop-carried variables"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"single_kernel.cl:60 > single_kernel.cl:88"
                    , "data":
                    [7, 6, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":60
                        }
                        , {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":88
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
              [218, 502, 2, 0]
              , "details":
              [
                "Logic required to efficiently support sets of operations that do not stall. This area cannot be affected directly."
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"single_kernel.cl:60 > single_kernel.cl:88"
              , "data":
              [32, 0, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":60
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":88
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Integer Compare"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":1
                }
              ]
            }
            , {
              "name":"single_kernel.cl:60 > single_kernel.cl:89"
              , "data":
              [575, 2103, 16, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":60
                  }
                  , {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":89
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Load"
                    , "data":
                    [9, 8, 0, 0]
                    , "details":
                    [
                      "Stall-free read from memory declared on single_kernel.cl:36."
                    ]
                  }
                  , "count":1
                }
                , {
                  "info":
                  {
                    "name":"Pointer Computation"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":2
                }
                , {
                  "info":
                  {
                    "name":"Store"
                    , "data":
                    [534, 2095, 16, 0]
                  }
                  , "count":1
                }
              ]
            }
          ]
        }
        , {
          "name":"Block7"
          , "resources":
          [
            {
              "name":"State"
              , "data":
              [32, 314, 0, 0]
              , "details":
              [
                "Resources for live values and control logic. To reduce this area:\n- reduce size of local variables\n- reduce scope of local variables, localizing them as much as possible\n- reduce number of nested loops"
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"No Source Line"
                    , "data":
                    [0, 32, 0, 0]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:42"
                    , "data":
                    [16, 206, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":42
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
                , {
                  "info":
                  {
                    "name":"single_kernel.cl:58"
                    , "data":
                    [16, 76, 0, 0]
                    , "debug":
                    [
                      [
                        {
                          "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                          , "line":58
                        }
                      ]
                    ]
                  }
                  , "count":0
                }
              ]
            }
          ]
          , "computation":
          [
            {
              "name":"single_kernel.cl:42"
              , "data":
              [32, 0, 0, 0]
              , "debug":
              [
                [
                  {
                    "filename":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl"
                    , "line":42
                  }
                ]
              ]
              , "subinfos":
              [
                {
                  "info":
                  {
                    "name":"Integer Compare"
                    , "data":
                    [32, 0, 0, 0]
                  }
                  , "count":1
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}
;var fileJSON=[{"index":0, "path":"/home/student/bgl0001/Senior_Design_FPGA/repo/OpenCL/single_kernel.cl", "name":"single_kernel.cl", "content":"#define TILE_WIDTH 256\012\012#define TILE_WIDTH      256\012#define POP_MAX         50\012#define CHROM_MAX       65\012#define CHROM_SIZE      64\012#define SEED            347834\012#define CROSS_PROB      0.85\012#define MUT_PROB        0.05      \012#define MIN_MUT_FUN     1000000\012#define NUM_GEN         100\012\012\012void get_parent(__global char * restrict cur_pop ,char * restrict chrom, int chrom_size, int pop_size);\012\012void copy_chrom_best_mem(__global char * restrict chrom1, char *restrict chrom2, int chrom_size);\012void copy_chrom(char * restrict chrom1, char * restrict  chrom2, int chrom_size);\012void copy_chrom_cur_pop(char * restrict chrom1,__global char * restrict chrom2, int chrom_size);\012\012\012int fit_fun(char * restrict chrom, int chrom_size);\012void cross_over(char * restrict chrom, char * restrict chrom1, char * restrict chrom2, int chrom_size);\012void mutate(char * restrict  chrom, int chrom_size);\012\012int rnd_chrom(int chrom_size);\012int rnd_member(int pop_size);\012\012\012__constant const int dst_mat[65][65]= {\012#include \"coords.h\"\012};\012        \012__kernel void genetic_algorithm(int pop_size, int chrom_size, int num_gen, int prob_cross, int prob_mut, int min_fit_fun,\012         __global char * restrict pop1, __global char * restrict pop2, __global char * restrict best_member)\012{\012        char parent1[CHROM_MAX];\012        char parent2[CHROM_MAX];\012        \012        int cur_obj;\012        char *temp_ptr;\012        \012        for (size_t j=0;j<pop_size;j++){\012            get_parent(pop1, parent1, chrom_size, pop_size);            /* Selection */\012\012            //if (prob_cross<drand48()) {\012            //    get_parent(pop1, parent2, chrom_size, pop_size);                    /* Selection */\012            //    cross_over(parent1,parent1,parent2, chrom_size);    /* Cross over */\012            //}\012\012            /* Mutation */\012            //if (prob_mut<drand48())               mutate(parent1, chrom_size);\012\012\012            for (size_t k=0;k<chrom_size;k++)    *(&pop2[0]+j*CHROM_MAX+k) = parent1[k];\012\012            cur_obj = fit_fun(parent1, chrom_size); /* Fitness */\012\012            if (cur_obj<min_fit_fun) {\012                min_fit_fun=cur_obj;\012                copy_chrom_best_mem(best_member,parent1, chrom_size);\012            }\012\012        }\012}\012\012void get_parent(__global char * restrict cur_pop ,char * restrict  chrom, int chrom_size, int pop_size)\012{\012        char can1[CHROM_MAX];\012        char can2[CHROM_MAX];\012        \012        copy_chrom_cur_pop(can1,(cur_pop + rnd_member(pop_size)*CHROM_MAX), chrom_size);\012\012        copy_chrom_cur_pop(can2,(cur_pop + rnd_member(pop_size)*CHROM_MAX), chrom_size);\012\012        if (fit_fun(can1, chrom_size)<fit_fun(can2, chrom_size))\012                copy_chrom(chrom,can1, chrom_size);\012        else\012                copy_chrom(chrom,can2, chrom_size);\012}\012void copy_chrom_cur_pop(char * restrict chrom1,__global char * restrict chrom2, int chrom_size)\012{\012       for (size_t i=0;i<chrom_size;i++)\012                chrom1[i] = chrom2[i];\012}\012\012void copy_chrom_best_mem(__global char * restrict chrom1, char * restrict chrom2, int chrom_size)\012{\012        for (size_t i=0;i<chrom_size;i++)\012                chrom1[i] = chrom2[i];\012}\012\012void copy_chrom(char * restrict chrom1, char * restrict chrom2, int chrom_size)\012{\012        for (size_t i=0;i<chrom_size;i++)\012                chrom1[i] = chrom2[i];\012}\012\012\012int fit_fun(char * restrict chrom, int chrom_size)\012{\012        int sum=0;\012     /*   for (size_t i=0;i<chrom_size-1;i++)\012                sum += dst_mat[(unsigned char)chrom[i]][(unsigned char)chrom[i+1]];\012        sum += dst_mat[(unsigned char)chrom[63]][64];\012        sum += dst_mat[64][(unsigned char)chrom[0]];*/\012        return sum;\012}\012\012void cross_over(char * restrict chrom, char * restrict chrom1, char * restrict chrom2, int chrom_size)\012{\012        int j;\012        int cross_pt;\012        int mask[CHROM_MAX];\012\012        cross_pt=rnd_chrom(chrom_size);\012        for (size_t i=0;i<chrom_size;i++)\012                mask[i] = 0;\012\012        j=0;\012\012        for (size_t i=0;i<chrom_size;i++) {\012                if (i<=cross_pt) {\012                    chrom[i]=chrom1[i];\012                    mask[(unsigned char)chrom1[i]] = 1; /* set mask */\012                }\012                else {\012                    while (mask[(unsigned char)chrom2[j]]!=0)\012                        j++;\012                    chrom[i] = chrom2[j];\012                    mask[(unsigned char)chrom2[j]]=1;\012                }\012        }\012}\012        \012\012int rnd_chrom(int chrom_size)\012{\012        int num = 0;\012//        do {\012//                num = drand48()*chrom_size;\012//        } while (num>=chrom_size);\012        return num;\012}\012\012int rnd_member(int pop_size)\012{\012        int num = 0;\012//    do {\012  //      num = drand48()*pop_size;\012  //  } while (num>=pop_size);\012\012    return num;\012}\012\012void mutate(char * chrom, int chrom_size)\012{\012        int mut_pt,insert_pt,chrom_hld;\012\012        mut_pt=rnd_chrom(chrom_size);\012        insert_pt=rnd_chrom(chrom_size);\012\012        if (insert_pt>mut_pt){\012                chrom_hld=chrom[mut_pt];\012                for(int i=mut_pt;i<insert_pt;i++)\012                        chrom[i]=chrom[i+1];\012                chrom[insert_pt]=chrom_hld;\012        }\012        else {\012                chrom_hld=chrom[mut_pt];\012                for (size_t i=mut_pt;i>insert_pt;i--)\012                        chrom[i]=chrom[i-1];\012                chrom[insert_pt]=chrom_hld;\012        }\012}\012"}];