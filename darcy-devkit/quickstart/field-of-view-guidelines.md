# Darcy Field of View Guidelines

Darcy’s computer vision AI capabilities are very flexible, but planning how to use them in a physical space requires reliable measurements and expectations regarding performance at different distances. All of that information is contained here in the tables below. Note that performance at a distance is a factor of camera resolution settings, but that higher resolution settings result in lower frame rates.

### Resolution 640 x 480px \(width x height\) <a id="Resolution-640-x-480px-(width-x-height)"></a>

Verification tests performed under average lighting conditions with good ambient light and supplementary indoor lighting. Some tests were performed against moderate “backlight” conditions wherein objects passed in front of windows. The same tests were also performed against interior walls, both those with sufficient lighting and those in partial shadow relative to the interior of the space.

#### Frames Per Second <a id="Frames-Per-Second"></a>

During all tests at 640 x 480px resolution, the FPS was between 20 and 25 with any number of subjects in the frame.

#### Body and Face Size Restrictions <a id="Body-and-Face-Size-Restrictions"></a>

Darcy can be configured to ignore objects below a certain size or above a certain size. This is valuable for reducing erroneous inferences and for preventing inference of objects which may not have enough pixels on target or may be too close to Darcy for accurate inference.

Initial tests for closer distances were performed with a minimum body height of 120px and a minimum face height of 20px.

Subsequent tests for longer distances were performed with a minimum body height of 60px and a minimum face height of 10px.

#### Successfully tested mounting heights <a id="Successfully-tested-mounting-heights"></a>

At each mounting height, the angle of the Darcy cam needs to be changed in order to optimize the coverage of desired areas. As you will see in the table below, mounting Darcy higher results in better coverage for distances but poorer coverage for close subjects. Mounting Darcy lower still provides excellent coverage of distances, but the view of those distances may be blocked by closer objects.

| **Mount Height** | **5 feet** | **10 feet** | **15 feet** | **20 feet** | **25 feet** | **30 feet** | **35 feet** |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 4.5 feet | Excellent | Excellent | Excellent | Good | Good | Fair | Fair |
| 6 feet | Excellent | Excellent | Excellent | Excellent | Good | Fair | Fair |
| 8 feet | Good | Excellent | Excellent | Excellent | Excellent | Good | Fair |
| 12 feet | Fair | Good | Good | Excellent | Excellent | Good | Good |

#### Actual Field of View and Region of Detection <a id="Actual-Field-of-View-and-Region-of-Detection"></a>

Due to objects becoming only partially visible as they approach the boundaries of Darcy’s vision, it is important to assess the difference between the strict field of view and the safety zone for AI inference which we will call the region of detection. The following measurements show Darcy’s visual field of view and region of detection for various distances.

| **Distance** | **FOV Width** | **FOV Height** | **ROD Width** | **ROD Height** |
| :--- | :--- | :--- | :--- | :--- |
| 5 feet | 6 feet | 4.5 feet | 6 feet | 4.5 feet |
| 10 feet | 12 feet | 7.5 feet | 11.5 feet | 7 feet |
| 15 feet | 18 feet | 12 feet | 17 feet | 11 feet |
| 20 feet | 22 feet | 15 feet | 20 feet | 13 feet |
| 25 feet | 28 feet | 19 feet | 25.5 feet | 16.5 feet |
| 30 feet | 34 feet | 23 feet | 31 feet | 20 feet |
| 35 feet | 38 feet | 25 feet | 33 feet | 20 feet |

#### Inference Quality at Distances <a id="Inference-Quality-at-Distances"></a>

A higher number of pixels available for AI inference results in more accurate data. The number of pixels found in an object within a video frame is called the “pixels on target”. Because every video frame or still image has a fixed number of pixels, distant objects may have a low number of pixels on target and little can be done to improve that situation. Some AI inference processes retain a high level of accuracy even with few pixels on target. Other processes begin to become less reliable as they approach the recommended distance limit for Darcy at a resolution of 640 x 480 pixels. The following table provides information about expected average inference quality at various distances.

| **Distance** | **Body Position** | **Face Position** | **Face Direction** | **Body Pose** |
| :--- | :--- | :--- | :--- | :--- |
| 5 feet | Excellent | Excellent | Excellent | Excellent |
| 10 feet | Excellent | Excellent | Excellent | Excellent |
| 15 feet | Excellent | Excellent | Excellent | Excellent |
| 20 feet | Excellent | Excellent | Excellent | Excellent |
| 25 feet | Excellent | Excellent | Good | Good |
| 30 feet | Excellent | Excellent | Good | Good |
| 35 feet | Excellent | Good | Fair | Fair |

