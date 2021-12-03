function varargout = Take2(varargin)
% TAKE2 MATLAB code for Take2.fig
%      TAKE2, by itself, creates a new TAKE2 or raises the existing
%      singleton*.
%
%      H = TAKE2 returns the handle to a new TAKE2 or the handle to
%      the existing singleton*.
%
%      TAKE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAKE2.M with the given input arguments.
%
%      TAKE2('Property','Value',...) creates a new TAKE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Take2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Take2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Take2

% Last Modified by GUIDE v2.5 22-Feb-2016 07:08:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Take2_OpeningFcn, ...
                   'gui_OutputFcn',  @Take2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Take2 is made visible.
function Take2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Take2 (see VARARGIN)

% Choose default command line output for Take2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Take2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Take2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in impimage.
function impimage_Callback(hObject, eventdata, handles)
% hObject    handle to impimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=imgetfile()
a=imread(a);
inimage=image(a)
setappdata(a)
